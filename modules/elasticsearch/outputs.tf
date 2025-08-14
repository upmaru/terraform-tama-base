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
