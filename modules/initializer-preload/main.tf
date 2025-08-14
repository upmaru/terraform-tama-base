resource "tama_thought_initializer" "this" {
  thought_id = var.thought_id

  reference = "tama/initializers/preload"
  class_id  = var.class_id
  index     = var.index
  parameters = jsonencode({
    concept = {
      relations  = var.concept_relations
      embeddings = var.concept_embeddings
      content    = var.concept_content
    }

    record = {
      rejections = var.record_rejections
    }

    parents  = var.parents
    children = var.children
  })
}
