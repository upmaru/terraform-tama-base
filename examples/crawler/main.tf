provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

resource "tama_space" "movie-db" {
  name = "Movie DB"
  type = "component"
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

data "tama_action" "movie-credits" {
  specification_id = tama_specification.tmdb.id
  identifier       = "movie-credits"
}

resource "tama_class_corpus" "movie-details-mapping" {
  class_id = data.tama_class.movie-details.id
  name     = "Crawl Movie Details"
  template = file("${path.module}/input-corpus.liquid")
}

module "crawler" {
  source = "../../modules/crawler"

  depends_on = [module.global]

  name = "Movie Credits Crawler"

  space_id        = tama_space.movie-db.id
  origin_class_id = data.tama_class.movie-details.id

  request_input_corpus_id = tama_class_corpus.movie-details-mapping.id

  request_relation  = "movie-credits-request"
  request_action_id = data.tama_action.movie-credits.id

  response_relation = "movie-credits-response"

  validate_record = false
}
