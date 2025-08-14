data "tama_space" "global" {
  id = "global"
}

data "tama_class" "answer" {
  space_id = data.tama_space.global.id
  name     = "answer"
}

data "tama_class_corpus" "answer-content" {
  class_id = data.tama_class.answer.id
  slug     = "answer-content"
}

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
      relations = var.relations
    })
  }
}

resource "tama_modular_thought" "embed" {
  count    = length(var.relations)
  chain_id = tama_chain.this.id

  index    = count.index + 1
  relation = "${var.relations[count.index]}-embedding"

  module {
    reference = "tama/concepts/embed"
    parameters = jsonencode({
      relation = var.relations[count.index]
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
  count = length(var.relations)

  thought_id = tama_modular_thought.embed[count.index].id

  type            = "concept"
  class_corpus_id = data.tama_class_corpus.answer-content.id
}
