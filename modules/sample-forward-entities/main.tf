resource "tama_chain" "this" {
  space_id = var.space_id
  name     = var.name
}

resource "tama_modular_thought" "sampling" {
  chain_id        = tama_chain.this.id
  index           = 0
  output_class_id = data.tama_class.collection.id
  relation        = var.sampling_relation

  module {
    reference = "tama/classes/sample"
  }
}

resource "tama_thought_path" "sample-class" {
  thought_id      = tama_modular_thought.sampling.id
  target_class_id = var.target_class_id

  parameters = jsonencode({
    limit               = var.limit
    ensure_chunk_exists = var.ensure_chunk_exists
    preload = {
      concept = {
        relations  = var.preload_concept_with_relations
        embeddings = "metadata"
        content = {
          action = "merge"
          merge = {
            location = "root"
            name     = "merge"
          }
        }
      }

      children = var.preload_children
      parents  = var.preload_parents
    }
  })
}

resource "tama_modular_thought" "forward" {
  chain_id = tama_chain.this.id
  index    = 1
  relation = var.forwarding_relation

  module {
    reference = "tama/concepts/forward"
  }
}

resource "tama_thought_path" "forward-to-index-generation" {
  thought_id      = tama_modular_thought.forward.id
  target_class_id = var.forward_to_class_id
}

resource "tama_thought_path_directive" "this" {
  thought_path_id   = tama_thought_path.forward-to-index-generation.id
  prompt_id         = var.prompt_id
  target_thought_id = var.forward_to_thought_id
}

resource "tama_node" "this" {
  space_id = var.space_id
  class_id = data.tama_class.class-proxy.id
  chain_id = tama_chain.this.id

  type = "explicit"
}
