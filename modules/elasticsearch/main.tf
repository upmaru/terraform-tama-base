resource "tama_space" "this" {
  name = var.name
  type = "component"
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
