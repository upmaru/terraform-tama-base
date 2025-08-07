variable "thought_id" {
  description = "The ID of the thought to which the contexts"
  type        = string
}

variable "contexts" {
  description = "The contexts of the thought"
  type = map(object({
    prompt_id = string
    layer     = optional(number)
    inputs = optional(list(object({
      type            = string
      class_corpus_id = string
    })), [])
  }))
}
