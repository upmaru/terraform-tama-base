output "query_schema" {
  value = jsonencode(yamldecode(templatefile("${path.module}/query.yaml", {
    endpoint = var.endpoint
  })))
  description = "The query schema for elasticsearch."
}

output "space_id" {
  value       = tama_space.this.id
  description = "The space id of elasticsearch space"
}

output "specification_id" {
  value       = tama_specification.manage.id
  description = "The specification id of elasticsearch specification"
}

output "index_generation_class_id" {
  value       = module.index-generation-forwardable.class.id
  description = "The class id of index generation class"
}

output "index_generation_thought_id" {
  value       = tama_modular_thought.generate-index-mapping.id
  description = "The thought id of index generation thought"
}
