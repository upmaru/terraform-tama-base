data "tama_space" "global" {
  id = "global"
}

data "tama_class" "entity-network" {
  space_id = data.tama_space.global.id
  name     = "entity-network"
}

resource "tama_chain" "this" {
  space_id = var.space_id
  name     = var.name
}

resource "tama_modular_thought" "this" {
  chain_id        = tama_chain.this.id
  index           = 0
  relation        = "network"
  output_class_id = data.tama_class.entity-network.id

  module {
    reference = "tama/entities/network"
    parameters = jsonencode({
      on = var.properties
    })
  }
}

resource "tama_thought_path" "this" {
  count = length(var.can_belongs_to_class_ids)

  thought_id      = tama_modular_thought.this.id
  target_class_id = var.can_belongs_to_class_ids[count.index]
}

resource "tama_node" "this" {
  count = length(var.class_ids)

  space_id = var.space_id
  class_id = var.class_ids[count.index]
  chain_id = tama_chain.this.id

  type = "reactive"
}
