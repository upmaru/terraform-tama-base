variable "name" {
  type        = string
  description = "The name of the corpus"
}

variable "foreign_keys" {
  description = "The id of the foreign keys"
  type        = list(string)
  default     = ["thread_id", "actor_id"]
}

variable "entity_network_class_id" {
  type        = string
  description = "The id of the entity network class"
}
