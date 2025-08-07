locals {
  # No flattening needed for contexts - can use var.contexts directly
  # contexts_map = var.contexts  # This is already a map

  # Only need to flatten inputs: map(object) -> flat list of all inputs
  all_inputs = flatten([
    for context_key, context in var.contexts : [
      for input_idx, input in context.inputs : {
        key             = "${context_key}-${input_idx}"
        context_key     = context_key
        prompt_id       = context.prompt_id
        layer           = context.layer
        type            = input.type
        class_corpus_id = input.class_corpus_id
      }
    ]
  ])

  # Convert inputs to map for for_each
  inputs_map = {
    for item in local.all_inputs : item.key => item
  }
}

# Create thought contexts using flattened contexts
resource "tama_thought_context" "this" {
  for_each = var.contexts

  thought_id = var.thought_id
  prompt_id  = each.value.prompt_id
  layer      = each.value.layer
}

resource "tama_thought_context_input" "this" {
  for_each = local.inputs_map

  thought_context_id = tama_thought_context.this[each.value.context_key].id
  type               = each.value.type
  class_corpus_id    = each.value.class_corpus_id
}
