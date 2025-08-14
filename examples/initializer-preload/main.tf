provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

resource "tama_space" "initializer-example" {
  name = "Initializer Example"
  type = "component"
}

locals {
  tmdb_openapi_url = "https://developer.themoviedb.org/openapi/64542913e1f86100738e227f"
}

data "http" "tmdb" {
  url = local.tmdb_openapi_url
}

resource "tama_specification" "tmdb" {
  space_id = tama_space.initializer-example.id

  depends_on = [module.global]

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

resource "tama_chain" "example" {
  space_id = tama_space.initializer-example.id
  name     = "Example Chain"
}

resource "tama_modular_thought" "example" {
  depends_on = [module.global]

  chain_id = tama_chain.example.id
  relation = "index"
  index    = 0

  module {
    reference = "tama/actions/caller"
  }
}

module "preloader" {
  source = "../../modules/initializer-preload"

  thought_id = tama_modular_thought.example.id
  class_id   = data.tama_class.movie-details.id
  index      = 0

  concept_relations  = ["description", "overview", "setting"]
  concept_embeddings = "include"
  concept_content = {
    action = "merge"
    merge = {
      location = "root"
    }
  }

  children = [
    { class = "movie-credits", as = "object" }
  ]
}
