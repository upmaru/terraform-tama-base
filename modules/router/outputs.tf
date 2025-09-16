output "chain_id" {
  value       = tama_chain.this.id
  description = "The ID of the router chain"
}

output "routing_thought_id" {
  value       = tama_modular_thought.this.id
  description = "The routing thought"
}

output "routing_thought_relation" {
  value       = tama_modular_thought.this.relation
  description = "The routing thought relation"
}
