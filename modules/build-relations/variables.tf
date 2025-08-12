variable "space_id" {
  type        = string
  description = "The ID of the space where the chain will be created"
}

variable "name" {
  type        = string
  description = "The name of the chain"
}

variable "properties" {
  type        = list(string)
  description = "The properties to build relations with."
  default     = ["parent_entity_id"]
}

variable "belongs_to_class_id" {
  type        = string
  description = "The ID of the class to which the classes belongs to."
}

variable "class_ids" {
  type        = list(string)
  description = "The IDs of the classes to network."
}
