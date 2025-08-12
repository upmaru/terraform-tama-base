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

module "extract-nested-properties-movie-db" {
  source = "../..//modules/extract-nested-properties"

  depends_on = [module.global]

  specification_id = tama_specification.tmdb.id
  class_names      = ["movie-credits"]

  space_id = tama_space.movie-db.id

  types = ["array"]
  depth = 1

  expected_class_names = ["movie-credits.cast", "movie-credits.crew"]
}

locals {
  spread_class_ids = values(module.extract-nested-properties-movie-db.extracted_class_ids)
}

module "spread" {
  source = "../../modules/spread"

  depends_on = [module.global]

  name = "Spread Cast and Crew"

  space_id = tama_space.movie-db.id
  class_id = data.tama_class.movie-credits.id

  fields = ["cast", "crew"]

  // this is essentially movie-credits.cast and movie-credits.crew
  target_class_ids = local.spread_class_ids
}
