resource "tama_chain" "this" {
  space_id = var.root_messaging_space_id
  name     = "Message Routing"
}

locals {
  relation = "routing"
}

resource "tama_modular_thought" "this" {
  chain_id        = tama_chain.this.id
  index           = 0
  relation        = local.relation
  output_class_id = var.message_routing_class_id

  module {
    reference = "tama/agentic/router"
    parameters = jsonencode({
      similarity = {
        limit     = var.similarity_limit
        threshold = var.similarity_threshold
      }

      classification = {
        class_name = var.classification_class_name
        properties = var.classification_properties
        thread = {
          limit = 10
          classes = {
            author  = var.author_class_name
            thread  = var.thread_class_name
            message = var.message_class_name
          }
          relations = {
            routing = local.relation
            focus   = var.focus_relations
          }
        }
      }
    })
  }
}

resource "tama_prompt" "this" {
  space_id = var.root_messaging_space_id
  name     = "Classify Message"
  role     = "system"
  content  = var.prompt
}

resource "tama_thought_context" "routing-context" {
  thought_id = tama_modular_thought.this.id
  layer      = 0
  prompt_id  = tama_prompt.this.id
}

resource "tama_node" "this" {
  count = length(var.routable_class_ids)

  space_id = var.root_messaging_space_id
  class_id = var.routable_class_ids[count.index]
  chain_id = tama_chain.this.id

  type = "reactive"
}

resource "tama_thought_processor" "this" {
  thought_id = tama_modular_thought.this.id
  model_id   = var.routing_model_id

  completion {
    temperature = var.routing_model_temperature
    parameters  = var.routing_model_parameters
  }
}
