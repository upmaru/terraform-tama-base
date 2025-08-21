variable "name" {
  description = "The name of the Elasticsearch space"
  default     = "elasticsearch"
}

variable "endpoint" {
  description = "The endpoint of the Elasticsearch server"
}

variable "api_key" {
  description = "The API key for authentication"
  sensitive   = false
}

variable "identity_identifier" {
  description = "The identifier for the identity"
  default     = "ApiKey"
}

variable "schema_version" {
  type        = string
  description = "Schema version for the model"
}

variable "validation" {
  description = "Used to verify that the API key is valid"

  type = object({
    path   = string,
    method = string,
    codes  = list(number)
  })

  default = {
    path   = "/_cluster/health",
    method = "GET",
    codes  = [200]
  }
}

variable "index_mapping_generation_model_id" {
  type        = string
  description = "The model id for index mapping generation"
}

variable "index_mapping_generation_temperature" {
  type        = number
  default     = 0.0
  description = "The temperature to use for index generation mapping"
}
