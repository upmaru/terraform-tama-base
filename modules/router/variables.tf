variable "root_messaging_space_id" {
  description = "The root messaging space"
  type        = string
}

variable "foreign_keys" {
  description = "The id of the foreign keys"
  type        = list(string)
  default     = ["thread_id", "actor_id"]
}

variable "thread_class_id" {
  description = "The id of the thread class"
  type        = string
}

variable "actor_class_id" {
  description = "The id of the actor class"
  type        = string
}

variable "entity_network_class_id" {
  description = "The id of the entity network class"
  type        = string
}

variable "message_routing_class_id" {
  description = "The id of the message routing class"
  type        = string
}

variable "prompt" {
  description = "The prompt for the router"
  type        = string
}

variable "look_back_limit" {
  description = "The number of messages to look back when routing"
  type        = number
  default     = 5
}

variable "similarity_limit" {
  description = "The similarity limit for the router"
  type        = number
  default     = 10
}

variable "similarity_threshold" {
  description = "The similarity threshold for the router"
  type        = number
  default     = 0.9
}

variable "classification_class_name" {
  description = "The name of the classification class"
  type        = string
  default     = "class"
}

variable "classification_properties" {
  description = "The properties of the classification class"
  type        = list(string)
  default     = ["class", "confidence"]
}
