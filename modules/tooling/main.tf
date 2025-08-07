resource "tama_modular_thought" "this" {
  chain_id = var.chain_id
  relation = var.relation
  index    = var.index

  output_class_id = var.tool_calling_class_id

  module {
    reference = "tama/agentic/tooling"
  }
}

resource "tama_thought_tool" "this" {
  count = length(var.action_ids)

  thought_id = tama_modular_thought.this.id
  action_id  = var.action_ids[count.index]
}

module "tooling-context" {
  source = "../thought-context"

  thought_id = tama_modular_thought.this.id
  contexts   = var.contexts
}
