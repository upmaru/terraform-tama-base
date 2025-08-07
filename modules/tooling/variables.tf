variable "tool_calling_class_id" {
  description = "The ID of the tool-calling class"
  type        = string
}

variable "chain_id" {
  description = "The ID of the chain"
  type        = string
}

variable "index" {
  description = "The index of the tool-calling class"
  type        = number
  default     = 0
}

variable "relation" {
  description = "The relation of the tool-calling class"
  type        = string
  default     = "tooling"
}

variable "action_ids" {
  description = "The IDs of the actions"
  type        = list(string)
}

variable "contexts" {
  description = "The contexts of the tool-calling class"
  type = map(object({
    prompt_id = string
    layer     = optional(number)
    inputs = optional(list(object({
      type            = string
      class_corpus_id = string
    })), [])
  }))
}
