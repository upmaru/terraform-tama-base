locals {
  schema_files = {
    for f in fileset("${path.module}/schemas", "*.json") :
    trimsuffix(f, ".json") => f
  }
}

resource "tama_space" "this" {
  name = "global"
  type = "global"
}

resource "tama_class" "class-proxy" {
  space_id = tama_space.this.id

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

  space_id    = tama_space.this.id
  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/${each.value}")))

  depends_on = [tama_class.class-proxy]
}

resource "tama_class_corpus" "answer-corpus" {
  class_id = tama_class.schemas["answer"].id

  main     = true
  name     = "Answer Content"
  template = "{{ data.content }}"
}

resource "tama_class_corpus" "context-metadata-corpus" {
  class_id = tama_class.schemas["context-metadata"].id

  main     = true
  name     = "Context Metadata"
  template = <<-EOT
  ACTOR ID: {{ data.actor_id }}
  CURRENT DATE AND TIME: {{ data.current_timestamp }}
  EOT
}

resource "tama_class" "forwarding" {
  space_id   = tama_space.this.id
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
  space_id   = tama_space.this.id
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
  space_id   = tama_space.this.id
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

resource "tama_chain" "identity-validation" {
  space_id = tama_space.this.id
  name     = "Identity Validation"
}

resource "tama_modular_thought" "validate" {
  chain_id        = tama_chain.identity-validation.id
  relation        = "validation"
  output_class_id = tama_class.schemas["task-result"].id

  module {
    reference = "tama/identities/validate"
  }
}
