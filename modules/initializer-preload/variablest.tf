variable "index" {
  type        = number
  description = "The index for the initializer lower numbers run first."
}

variable "thought_id" {
  type        = string
  description = "The ID of the thought."
}

variable "class_id" {
  type        = string
  description = "The ID of the class that has to match for the initializer run."
}

variable "concept_relations" {
  type        = list(string)
  default     = []
  description = "List of concept relations to preload."
}

variable "concept_embeddings" {
  type        = string
  description = "What to do with embeddings exclude, include or only metadata"
  default     = "exclude"
}

variable "concept_content" {
  description = "What to do with the content of the concept"

  type = object({
    action = optional(string, "merge")
    merge = object({
      location = optional(string, "concept")
      name     = optional(string, "merge")
    })
  })

  default = {
    action = "merge"
    merge = {
      location = "concept"
      name     = "merge"
    }
  }
}

variable "record_rejections" {
  description = "Rejection rules for parameters in a record."

  type = list(object({
    element = string
    matches = list(string)
  }))

  default = [
    { element = "value", matches = [""] }
  ]
}

variable "parents" {
  description = "List of parent to preload"

  type = list(object({
    class = string
    on    = optional(string, "parent_entity_id")
    as    = string

    record = optional(object({
      rejections = list(object({
        element = string
        matches = list(string)
      }))
    }))

    concept = optional(object({
      action = string
      merge = object({
        location = string
        name     = string
      })
    }))

    parents  = optional(list(object({})), [])
    children = optional(list(object({})), [])
  }))

  default = []
}

variable "children" {
  description = "List of children preload"

  type = list(object({
    class = string
    on    = optional(string, "parent_entity_id")
    as    = string

    record = optional(object({
      rejections = list(object({
        element = string
        matches = list(string)
      }))
    }))

    concept = optional(object({
      action = string
      merge = object({
        location = string
        name     = string
      })
    }))

    parents  = optional(list(object({})), [])
    children = optional(list(object({})), [])
  }))

  default = []
}
