output "query_schema" {
  value = jsonencode(yamldecode(templatefile("${path.module}/query.yaml", {
    endpoint = var.endpoint
  })))
}
