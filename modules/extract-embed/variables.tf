variable "space_id" {
  description = "The Space ID"
  type        = string
}

variable "name" {
  description = "Name of the Chain"
  type        = string
}

variable "relations" {
  description = "The relations"
  type        = list(string)
  default     = ["content"]
}

variable "embeddable_class_ids" {
  description = "The embeddable class IDs"
  type        = list(string)
}
