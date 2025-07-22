locals {
  schema_files = {
    for f in fileset("${path.module}/schemas", "*.json") :
    trimsuffix(f, ".json") => f
  }
}

data "tama_space" "global" {
  id = "global"
}

resource "tama_class" "class-proxy" {
  space_id = data.tama_space.global.id

  schema {
    title       = "class-proxy"
    description = <<-EOT
    Represents proxy entity of a given class.
    ## Fields:
    - schema: The schema of the class
    EOT
    type        = "object"
    properties = jsonencode({
      name        = { type = "string" }
      description = { type = "string" }
      schema      = { type = "object" }
    })
  }
}

resource "tama_class" "schemas" {
  for_each = local.schema_files

  space_id    = data.tama_space.global.id
  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/${each.value}")))

  depends_on = [tama_class.class-proxy]
}

resource "tama_class" "forwarding" {
  space_id   = data.tama_space.global.id
  depends_on = [tama_class.class-proxy]

  schema {
    title       = "forwarding"
    description = <<-EOT
    A forwarding is a forwarding of a message to another entity.

    ## Fields:
    - forwarded_to_entity_id: The id of the entity that the message is forwarded to.
    EOT
    type        = "object"
    properties = jsonencode({
      forwarded_to_entity_id = {
        type        = "string"
        description = "The id of the entity that the message is forwarded to."
      }
    })
  }
}

resource "tama_class" "entity-network" {
  space_id   = data.tama_space.global.id
  depends_on = [tama_class.class-proxy]

  schema {
    title       = "entity-network"
    description = <<-EOT
    A entity network is records the connections between entities.

    ## Fields:
    - edges: An array of entity ids that are connected to the entity.
    EOT
    type        = "object"
    properties = jsonencode({
      edges = {
        type        = "array"
        description = "An array of entity ids that are connected to the entity."
        items = {
          type = "object"
          properties = {
            id = {
              type        = "string"
              description = "The id of the entity that is connected to the entity."
            }
            level = {
              type        = "integer"
              description = "The level of the entity that is connected to the entity."
            }
            parent_id = {
              type        = ["string", "null"]
              description = "The id of the parent entity that is connected to the entity."
            }
          }
          required = ["id", "level"]
        }
      }
    })
    required = ["edges"]
  }
}

resource "tama_class" "action" {
  space_id   = data.tama_space.global.id
  depends_on = [tama_class.class-proxy]

  schema {
    title       = "action"
    description = <<-EOT
    An action is a tool that can be called by a model.

    ## Fields:
    - name: The name of the action.
    - summary: A short summary of the action.
    - description: The description of the action.
    EOT
    type        = "object"
    properties = jsonencode({
      name = {
        type        = "string"
        description = "The name of the action."
      }
      summary = {
        type        = "string"
        description = "A short summary of the action."
      }
      description = {
        type        = "string"
        description = "The description of the action."
      }
    })
  }
}
