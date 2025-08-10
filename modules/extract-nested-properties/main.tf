data "tama_class" "classes" {
  for_each         = toset(var.class_names)
  specification_id = var.specification_id
  name             = each.value
}

resource "tama_chain" "this" {
  space_id = var.space_id
  name     = "Extract Nested Properties"
}

resource "tama_modular_thought" "this" {
  chain_id = tama_chain.extract-nested-properties.id
  index    = 0
  relation = "extraction"

  module {
    reference = "tama/classes/extraction"
    parameters = jsonencode({
      types = var.types
      depth = var.depth
    })
  }
}

resource "tama_thought_path" "this" {
  for_each        = data.tama_class.classes
  thought_id      = tama_modular_thought.this.id
  target_class_id = each.value.id
}

resource "tama_node" "handle-nested-extraction" {
  space_id = var.space_id
  class_id = var.class_proxy_class_id
  chain_id = tama_chain.this.id

  type = "explicit"
}
