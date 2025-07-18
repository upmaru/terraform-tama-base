output "model_ids" {
  description = "Map of model identifiers to their IDs"
  value       = { for k, v in tama_model.this : k => v.id }
}

output "source_id" {
  description = "ID of the source"
  value       = tama_source.this.id
}
