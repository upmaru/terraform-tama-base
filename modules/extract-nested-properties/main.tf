data "tama_space" "global" {
  id = "global"
}

data "tama_class" "class-proxy" {
  space_id = data.tama_space.global.id
  name     = "class-proxy"
}

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
  chain_id = tama_chain.this.id
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

resource "tama_node" "this" {
  space_id = var.space_id
  class_id = data.tama_class.class-proxy.id
  chain_id = tama_chain.this.id

  type = "explicit"
}

resource "tama_class_operation" "this" {
  for_each  = data.tama_class.classes
  class_id  = each.value.id
  chain_ids = [tama_chain.this.id]
  node_type = "explicit"

  depends_on = [tama_node.this, tama_thought_path.this]

  wait_for {
    field {
      name = "current_state"
      in   = ["processed"]
    }
  }
}

data "tama_class" "extracted" {
  for_each = toset(var.expected_class_names)

  depends_on = [tama_class_operation.this]

  space_id = var.space_id
  name     = each.value
}
