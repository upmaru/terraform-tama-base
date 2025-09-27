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

  depends_on = [module.global.schemas]

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
    },
    {
      identifier = "grok-4"
      path       = "/chat/completions"
    }
  ]
}

module "elasticsearch" {
  source = "../../modules/elasticsearch"

  depends_on = [module.global.schemas]

  name           = "elasticsearch"
  schema_version = "1.0.0"
  endpoint       = "https://elasticsearch.arrakis.upmaru.network"

  api_key = var.elasticsearch_api_key

  index_mapping_generation_model_id          = module.xai.model_ids.grok-3-mini
  index_mapping_generation_model_temperature = 1.0
  index_mapping_generation_model_parameters = jsonencode({
    reasoning_effort = "high"
  })
}
