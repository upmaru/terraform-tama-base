resource "tama_chain" "this" {
  space_id = var.root_messaging_space_id
  name     = "Message Routing"
}

resource "tama_modular_thought" "network" {
  chain_id        = tama_chain.this.id
  index           = 0
  relation        = "network"
  output_class_id = var.entity_network_class_id

  module {
    reference = "tama/entities/network"
    parameters = jsonencode({
      on = var.foreign_keys
    })
  }
}

resource "tama_thought_path" "network-thread" {
  thought_id      = tama_modular_thought.network.id
  target_class_id = var.thread_class_id
}

resource "tama_thought_path" "network-actor" {
  thought_id      = tama_modular_thought.network.id
  target_class_id = var.actor_class_id
}

resource "tama_modular_thought" "routing" {
  chain_id        = tama_chain.this.id
  index           = 1
  relation        = "routing"
  output_class_id = var.message_routing_class_id

  module {
    reference = "tama/agentic/router"
    parameters = jsonencode({
      similarity = {
        limit     = var.similarity_limit
        threshold = var.similarity_threshold
      }

      classification = {
        class_name      = var.classification_class_name
        properties      = var.classification_properties
        look_back_limit = var.look_back_limit
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
  thought_id = tama_modular_thought.routing.id
  layer      = 0
  prompt_id  = tama_prompt.this.id
}
