variable "api_key" {
  type        = string
  description = "API key for the model"
  sensitive   = true
}

variable "name" {
  type        = string
  description = "Name for the model"
}

variable "space_id" {
  type        = string
  description = "Space ID for the model"
}

variable "endpoint" {
  type        = string
  description = "Endpoint for the model"
}

variable "requests_per_second" {
  type        = number
  description = "Requests per second limit"
  default     = 10
}

variable "models" {
  type = list(object({
    identifier = string
    path       = string
    parameters = optional(object({}), {})
  }))

  description = "List of models with their identifiers and paths"
}
