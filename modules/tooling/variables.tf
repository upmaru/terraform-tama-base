variable "tool_call_model_id" {
  description = "The ID of the tool-call model"
  type        = string
}

variable "tool_call_model_temperature" {
  description = "The temperature of the tool-call model"
  type        = number
  default     = 0.0
}

variable "tool_call_model_parameters" {
  description = "The parameters of the tool-call model"
  type        = map(any)
  default     = {}
}

variable "chain_id" {
  description = "The ID of the chain"
  type        = string
}

variable "index" {
  description = "The index of the tool-calling class"
  type        = number
  default     = 0
}

variable "relation" {
  description = "The relation of the tool-calling class"
  type        = string
  default     = "tooling"
}

variable "action_ids" {
  description = "The IDs of the actions"
  type        = list(string)
}

variable "tooling_parameters" {
  description = "The parameters of the tool calling thought"
  type = object({
    consecutive_limit = number
    thread = object({
      limit = number
      classes = object({
        author  = string
        thread  = string
        message = string
      })
      relations = object({
        routing = string
        focus   = list(string)
      })
    })
  })
  default = {
    consecutive_limit = 5
    thread = {
      limit = 5
      classes = {
        author  = "actor",
        thread  = "thread",
        message = "user-message"
      }
      relations = {
        routing = "routing"
        focus   = ["tooling", "reply"]
      }
    }
  }
}

variable "contexts" {
  description = "The contexts of the tool-calling class"
  type = map(object({
    prompt_id = string
    layer     = optional(number)
    inputs = optional(list(object({
      type            = string
      class_corpus_id = string
    })), [])
  }))
}
