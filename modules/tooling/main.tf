resource "tama_modular_thought" "this" {
  chain_id = var.chain_id
  relation = var.relation
  index    = var.index

  output_class_id = data.tama_class.tool-call.id

  module {
    reference  = "tama/agentic/tooling"
    parameters = jsonencode(var.tooling_parameters)
  }

  dynamic "faculty" {
    for_each = var.faculty_queue_id == null ? [] : [1]
    content {
      queue_id = var.faculty_queue_id
      priority = var.faculty_priority
    }
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

resource "tama_thought_processor" "this" {
  thought_id = tama_modular_thought.this.id
  model_id   = var.tool_call_model_id

  completion {
    temperature = var.tool_call_model_temperature
    parameters  = jsonencode(var.tool_call_model_parameters)
  }
}
