variable "space_id" {
  description = "The Space ID"
  type        = string
}

variable "name" {
  description = "Name of the Chain"
  type        = string
}

variable "answer_class_id" {
  description = "The answer class ID"
  type        = string
}

variable "answer_class_corpus_id" {
  description = "The answer class corpus id"
  type        = string
}

variable "relation" {
  description = "The relation"
  type        = string
  default     = "content"
}

variable "embeddable_class_ids" {
  description = "The embeddable class IDs"
  type        = list(string)
}
