output "schemas" {
  value = merge(
    tama_class.schemas,
    {
      forwarding     = tama_class.forwarding
      entity-network = tama_class.entity-network
      action         = tama_class.action
    }
  )
}
