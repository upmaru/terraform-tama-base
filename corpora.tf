resource "tama_class_corpus" "answer-corpus" {
  class_id = tama_class.schemas["answer"].id

  main     = true
  name     = "Answer Content"
  template = "{{ data.content }}"
}

resource "tama_class_corpus" "context-metadata-corpus" {
  class_id = tama_class.schemas["context-metadata"].id

  main     = true
  name     = "Context Metadata"
  template = <<-EOT
  ACTOR ID: {{ data.actor_id }}
  CURRENT DATE AND TIME: {{ data.current_timestamp }}
  EOT
}

resource "tama_class_corpus" "action-call-json-corpus" {
  class_id = tama_class.schemas["action-call"].id

  main     = true
  name     = "Action Call JSON"
  template = "{{ data | json }}"
}
