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

variable "convert_to_json_corpus_id" {
  type        = string
  description = "The ID of the corpus that converts response of the call into JSON."
}

variable "crawl_class_id" {
  type        = string
  description = "The ID of the class to crawl."
}

variable "request_relation" {
  type        = string
  description = "The relation of the request."
}

variable "response_relation" {
  type        = string
  description = "The relation of the response."
}
