output "chain_id" {
  value       = tama_chain.this.id
  description = "The ID of the router chain"
}

output "routing_thought_id" {
  value       = tama_modular_thought.routing.id
  description = "The routing thought"
}

output "network_thought_id" {
  value       = tama_modular_thought.network.id
  description = "The network thought"
}
