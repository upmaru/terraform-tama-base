resource "tama_chain" "this" {
  space_id = var.space_id

  name = var.name
}

resource "tama_modular_thought" "extract" {
  chain_id = tama_chain.this.id

  index    = 0
  relation = "extraction"

  module {
    reference = "tama/entities/extraction"
    parameters = jsonencode({
      relations = [var.relation]
    })
  }
}

resource "tama_modular_thought" "embed" {
  chain_id = tama_chain.this.id

  index    = 1
  relation = "embedding"

  module {
    reference = "tama/concepts/embed"
    parameters = jsonencode({
      relation = var.relation
    })
  }
}

resource "tama_node" "this" {
  count = length(var.embeddable_class_ids)

  space_id = var.space_id
  class_id = var.embeddable_class_ids[count.index]
  chain_id = tama_chain.this.id

  type = "reactive"
}

resource "tama_thought_module_input" "input-answer-corpus" {
  thought_id = tama_modular_thought.embed.id

  type            = "concept"
  class_corpus_id = var.answer_class_corpus_id
}
