resource "tama_space" "this" {
  name = var.name
  type = "component"
}

resource "tama_class" "elasticsearch-mapping" {
  space_id    = tama_space.this.id
  schema_json = jsonencode(jsondecode(file("${path.module}/elasticsearch-mapping.json")))
}

module "index-generation-forwardable" {
  source = "../../modules/forwardable-class"

  space_id    = tama_space.this.id
  title       = "index-generation"
  description = "For generating elasticsearch index"
}

resource "tama_class_corpus" "elasticsearch-mapping" {
  class_id = tama_class.elasticsearch-mapping.id
  name     = "Elasticsearch Mapping"
  template = file("${path.module}/mapping.liquid")
}

resource "tama_specification" "manage" {
  space_id = tama_space.this.id
  endpoint = var.endpoint
  version  = var.schema_version

  schema = jsonencode(yamldecode(templatefile("${path.module}/manage.yaml", {
    endpoint = var.endpoint
  })))

  wait_for {
    field {
      name = "current_state"
      in   = ["completed", "failed"]
    }
  }
}

resource "tama_source_identity" "manage" {
  specification_id = tama_specification.manage.id
  identifier       = var.identity_identifier

  api_key = var.api_key

  validation {
    path   = var.validation.path
    method = var.validation.method
    codes  = var.validation.codes
  }

  wait_for {
    field {
      name = "current_state"
      in   = ["active", "failed"]
    }
  }
}
