resource "tama_space" "this" {
  name = var.name
  type = "root"
}

resource "tama_class" "actor" {
  space_id = tama_space.this.id

  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/actor.json")))
}

resource "tama_class" "thread" {
  space_id = tama_space.this.id

  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/thread.json")))
}

resource "tama_class" "user-message" {
  space_id = tama_space.this.id

  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/user-message.json")))
}

resource "tama_class_corpus" "user-message-corpus" {
  class_id = tama_class.user-message.id

  name     = "User Message Corpus"
  main     = true
  template = <<-EOT
  {{ data.content }}
  EOT
}

resource "tama_class" "response" {
  space_id = tama_space.this.id

  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/response.json")))
}

resource "tama_chain" "network-message" {
  space_id = tama_space.this.id
  name     = "Network Message"
}

resource "tama_modular_thought" "network" {
  chain_id = tama_chain.network-message.id

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
  target_class_id = tama_class.thread.id
}

resource "tama_thought_path" "network-actor" {
  thought_id      = tama_modular_thought.network.id
  target_class_id = tama_class.actor.id
}

resource "tama_node" "network-assistant-message" {
  space_id = tama_space.this.id
  class_id = tama_class.assistant-message.id
  chain_id = tama_chain.network-message.id

  type = "reactive"
}

resource "tama_node" "network-tool-message" {
  space_id = tama_space.this.id
  class_id = tama_class.tool-message.id
  chain_id = tama_chain.network-message.id

  type = "reactive"
}
