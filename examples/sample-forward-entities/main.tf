provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

variable "xai_api_key" {}
module "xai" {
  source = "../../modules/inference-service"

  space_id = module.global.space.id
  api_key  = var.xai_api_key
  endpoint = "https://api.x.ai/v1"
  name     = "xai"

  requests_per_second = 4

  models = [
    {
      identifier = "grok-3-mini"
      path       = "/chat/completions"
      parameters = jsonencode({
        reasoning_effort = "high"
      })
    },
    {
      identifier = "grok-3-mini-fast"
      path       = "/chat/completions"
      parameters = jsonencode({
        reasoning_effort = "low"
      })
    }
  ]
}

module "elasticsearch" {
  source = "../../modules/elasticsearch"

  depends_on = [module.global]

  name           = "elasticsearch"
  schema_version = "1.0.0"
  endpoint       = "https://elasticsearch.arrakis.upmaru.network"
  api_key        = var.elasticsearch_api_key

  index_mapping_generation_model_id          = module.xai.model_ids["grok-3-mini"]
  index_mapping_generation_model_temperature = 1.0
  index_mapping_generation_model_parameters = jsonencode({
    reasoning_effort = "high"
  })
}

resource "tama_space" "movie-db" {
  name = "Movie DB"
  type = "component"
}

resource "tama_space_bridge" "movie-db-elasticsearch" {
  space_id        = tama_space.movie-db.id
  target_space_id = module.elasticsearch.space_id
}

locals {
  tmdb_openapi_url = "https://developer.themoviedb.org/openapi/64542913e1f86100738e227f"
}

data "http" "tmdb" {
  url = local.tmdb_openapi_url
}

resource "tama_specification" "tmdb" {
  space_id = tama_space.movie-db.id

  endpoint = local.tmdb_openapi_url
  version  = "3.0.0"
  schema   = jsonencode(jsondecode(data.http.tmdb.response_body))

  wait_for {
    field {
      name = "current_state"
      in   = ["completed", "failed"]
    }
  }
}

data "tama_class" "movie-details" {
  specification_id = tama_specification.tmdb.id
  name             = "movie-details"
}

resource "tama_prompt" "movie-details-constriants" {
  space_id = tama_space.movie-db.id
  name     = "Movie DB Constraints"
  role     = "user"
  content  = file("${path.module}/prompt.md")
}

module "sample-forward-entities" {
  source = "../../modules/sample-forward-entities"

  depends_on = [module.global, module.elasticsearch]

  name     = "Sample and Forward Movie Data"
  space_id = tama_space.movie-db.id

  limit                          = 3
  ensure_chunk_exists            = true
  preload_concept_with_relations = ["description", "overview", "setting"]
  preload_children = [
    { class = "movie-credits", as = "object", record = { rejections = [] } }
  ]

  target_class_id = data.tama_class.movie-details.id
  prompt_id       = tama_prompt.movie-details-constriants.id

  forward_to_thought_id = module.elasticsearch.index_generation_thought_id
  forward_to_class_id   = module.elasticsearch.index_generation_class_id
}
