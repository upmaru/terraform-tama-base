locals {
  models_map = { for model in var.models : model.identifier => model }
}

resource "tama_source" "this" {
  space_id = var.space_id
  api_key  = var.api_key
  endpoint = var.endpoint
  name     = var.name
  type     = "model"
  request  = var.request
}

resource "tama_source_limit" "this" {
  source_id   = tama_source.this.id
  scale_count = 1
  scale_unit  = "seconds"
  value       = var.requests_per_second
}

resource "tama_model" "this" {
  for_each = local.models_map

  source_id  = tama_source.this.id
  identifier = each.key
  path       = each.value.path
  parameters = each.value.parameters
}
