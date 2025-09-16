resource "tama_space" "this" {
  name = var.name
  type = "root"
}

resource "tama_class" "actor" {
  space_id = tama_space.this.id

  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/actor.json")))
}

resource "tama_class" "thread" {
  space_id = tama_space.this.id

  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/thread.json")))
}

resource "tama_class" "user-message" {
  space_id = tama_space.this.id

  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/user-message.json")))
}

resource "tama_class_corpus" "user-message-corpus" {
  class_id = tama_class.user-message.id

  name     = "User Message Corpus"
  main     = true
  template = <<-EOT
  {{ data.content }}
  EOT
}

resource "tama_class" "response" {
  space_id = tama_space.this.id

  schema_json = jsonencode(jsondecode(file("${path.module}/schemas/response.json")))
}
