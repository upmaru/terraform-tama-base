variable "root_messaging_space_id" {
  description = "The root messaging space"
  type        = string
}

variable "network_message_thought_id" {
  description = "The id of the network message thought"
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

variable "routable_class_ids" {
  description = "The ids of the classes to network"
  type        = list(string)
}

variable "routing_model_id" {
  description = "The model to use for routing"
  type        = string
}

variable "routing_model_parameters" {
  description = "The parameters for the routing model"
  type        = string
}

variable "routing_model_temperature" {
  description = "The temperature for the routing mode"
  type        = number
  default     = 1.0
}
