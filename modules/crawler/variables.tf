variable "space_id" {
  type        = string
  description = "The ID of the space where the chain will be created."
}

variable "request_input_corpus_id" {
  type        = string
  description = "The ID of the corpus where the request input will be passed into."
}

variable "request_action_id" {
  type        = string
  description = "The ID of the action that will be executed when the request is made."
}

variable "origin_class_id" {
  type        = string
  description = "The ID of the class of entities that start the crawl."
}

variable "request_relation" {
  type        = string
  description = "The relation of the request."
}

variable "response_relation" {
  type        = string
  description = "The relation of the response."
}

variable "identifier" {
  type        = string
  description = "The identifier of the record."
  default     = "id"
}

variable "validate_record" {
  type        = bool
  description = "Whether to validate the record on creation."
  default     = true
}

variable "process_entity" {
  type        = bool
  description = "Whether to process the entity."
  default     = true
}
