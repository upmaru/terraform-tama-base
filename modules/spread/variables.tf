variable "space_id" {
  type        = string
  description = "The Space ID to use for the chain"
}

variable "name" {
  type        = string
  description = "The name of the chain"
}

variable "class_id" {
  type        = string
  description = "The class ID to use for the chain"
}

variable "fields" {
  type        = list(string)
  description = "Name of the fields to spread"
}

variable "identifier" {
  type        = string
  description = "Name of the identifier to use for the fields"
  default     = "id"
}

variable "target_class_ids" {
  type        = list(string)
  description = "List of class IDs to spread the entries into."
}

variable "relation" {
  type        = string
  description = "Name of the relation to use for the concept"
  default     = "spread"
}
