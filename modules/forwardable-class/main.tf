resource "tama_class" "this" {
  space_id = var.space_id

  schema {
    type        = "object"
    title       = var.title
    description = var.description

    properties = jsonencode({
      forwarded_from_concept_id = {
        description = "The concept that forwarded this message"
        type        = ["string", "null"]
      }

      origin_entity_id = {
        description = "The origin entity with the original message"
        type        = "string"
      }

      directive_ids = {
        type        = "array"
        description = "The id of the directives to pass in the flow."
        items = {
          type        = "string"
          description = "The id of the directive."
        }
      }
    })
  }
}
