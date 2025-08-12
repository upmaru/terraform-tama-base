data "tama_space" "global" {
  id = "global"
}

data "tama_class" "action-call" {
  space_id = data.tama_space.global.id
  name     = "action-call"
}

resource "tama_chain" "this" {
  space_id = var.space_id
  name     = "Crawl Movie Credits"
}

resource "tama_modular_thought" "request" {
  chain_id = tama_chain.this.id

  index           = 0
  relation        = var.request_relation
  output_class_id = data.tama_class.action-call.id

  module {
    reference = "tama/actions/caller"
  }
}

resource "tama_thought_module_input" "request" {
  thought_id = tama_modular_thought.request.id

  type            = "entity"
  class_corpus_id = var.request_input_corpus_id
}

resource "tama_thought_tool" "request" {
  thought_id = tama_modular_thought.request.id

  action_id = var.request_action_id
}

resource "tama_modular_thought" "response" {
  chain_id = tama_chain.this.id

  index    = 1
  relation = var.response_relation

  module {
    reference = "tama/actions/response"
    parameters = jsonencode({
      relation        = var.request_relation
      identifier      = var.identifier
      validate_record = var.validate_record
      process_entity  = var.process_entity
    })
  }
}

data "tama_class_corpus" "action-response-to-json" {
  class_id = data.tama_class.action-call.id
  slug     = "action-call-json"
}

resource "tama_thought_module_input" "convert-to-json" {
  thought_id = tama_modular_thought.response.id

  type            = "concept"
  class_corpus_id = data.tama_class_corpus.action-response-to-json.id
}

resource "tama_node" "this" {
  space_id = var.space_id
  class_id = var.origin_class_id
  chain_id = tama_chain.this.id

  type = "reactive"
}
