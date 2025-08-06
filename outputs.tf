output "space" {
  description = "The Global Space"
  value       = tama_space.this
}

output "schemas" {
  description = "Schemas for the Global Space"
  value = merge(
    tama_class.schemas,
    {
      class-proxy    = tama_class.class-proxy
      forwarding     = tama_class.forwarding
      entity-network = tama_class.entity-network
      action         = tama_class.action
    }
  )
}

output "answer_corpus_id" {
  description = "ID of the Answer Corpus"
  value       = tama_class_corpus.answer-corpus.id
}

output "context_metadata_corpus_id" {
  description = "ID of the Context Metadata Corpus"
  value       = tama_class_corpus.context-metadata-corpus.id
}
