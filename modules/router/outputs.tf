output "chain_id" {
  value       = tama_chain.this.id
  description = "The ID of the router chain"
}

output "routing_thought_id" {
  value       = tama_thought.routing.id
  description = "The routing thought"
}
