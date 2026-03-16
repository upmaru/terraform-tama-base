variable "name" {
  type        = string
  description = "The name of the Exa space"
  default     = "exa"
}

variable "endpoint" {
  type        = string
  description = "The Exa API endpoint"
  default     = "https://api.exa.ai"
}

variable "api_key" {
  type        = string
  description = "The API key for Exa"
  sensitive   = true
}

variable "identity_identifier" {
  type        = string
  description = "The security scheme identifier used by the specification"
  default     = "ApiKey"
}

variable "schema_version" {
  type        = string
  description = "Schema version for the Exa specification"
  default     = "1.0.0"
}

variable "validation" {
  description = "Validation request used to verify that the API key is accepted by Exa"

  type = object({
    path   = string,
    method = string,
    codes  = list(number)
  })

  default = {
    path   = "/search"
    method = "POST"
    codes  = [400, 422]
  }
}
