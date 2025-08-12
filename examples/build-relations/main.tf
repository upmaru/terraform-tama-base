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

data "tama_class" "movie-credits" {
  specification_id = tama_specification.tmdb.id
  name             = "movie-credits"
}

module "extract-nested-properties" {
  source = "../../modules/extract-nested-properties"

  depends_on = [module.global]

  space_id         = tama_space.movie-db.id
  specification_id = tama_specification.tmdb.id

  types = ["array"]
  depth = 1

  class_names = ["movie-credits"]
  expected_class_names = [
    "movie-credits.cast",
    "movie-credits.crew"
  ]
}

module "network-cast-and-crew" {
  source = "../../modules/build-relations"

  depends_on = [module.global]

  name                = "Network Cast and Crew"
  space_id            = tama_space.movie-db.id
  belongs_to_class_id = data.tama_class.movie-credits.id

  class_ids = values(module.extract-nested-properties.extracted_class_ids)
}
