variable "name" {
  type        = string
  description = "Name of the Chain"
}

variable "space_id" {
  type        = string
  description = "The space ID to forward the sample to."
}

variable "sampling_relation" {
  type        = string
  description = "The relation of sampling data thought."
  default     = "sample"
}

variable "forwarding_relation" {
  type        = string
  description = "The relation of forwarding data thought."
  default     = "forward"
}

variable "limit" {
  type        = number
  description = "The sample size"
  default     = 3
}

variable "ensure_chunk_exists" {
  type        = bool
  description = "Ensure to only use sample where the chunk exists"
  default     = true
}

variable "target_class_id" {
  type        = string
  description = "The target class ID to sample data from"
}

variable "preload_concept_with_relations" {
  type        = list(string)
  description = "List of concept relations to preload with each entity"
}

variable "forward_to_class_id" {
  type        = string
  description = "The class ID to forward the sample to."
}

variable "prompt_id" {
  type        = string
  description = "The prompt with constraints and rules for index generation"
}

variable "forward_to_thought_id" {
  type        = string
  description = "The ID of the index generation thought."
}

variable "preload_children" {
  type = list(object({
    class = string
    on    = optional(string, "parent_entity_id")
    as    = string

    record = optional(object({
      rejections = list(object({
        element = string
        matches = list(string)
      }))
    }), { rejections = [] })

    concept = optional(object({
      relations  = optional(list(string), [])
      embeddings = optional(string, "exclude")
      content = optional(object({
        action = string
        merge = object({
          location = string
          name     = string
        })
        }), {
        action = "merge"
        merge = {
          location = "concept"
          name     = "merge"
        }
      })
      }), {
      relations  = []
      embeddings = "exclude"
      content = {
        action = "merge"
        merge = {
          location = "concept"
          name     = "merge"
        }
      }
    })

    parents  = optional(list(object({})), [])
    children = optional(list(object({})), [])
  }))

  description = "List of children preloads"
  default     = []
}

variable "preload_parents" {
  type = list(object({
    class = string
    on    = optional(string, "parent_entity_id")
    as    = string

    record = optional(object({
      rejections = list(object({
        element = string
        matches = list(string)
      }))
    }), { rejections = [] })

    concept = optional(object({
      relations  = optional(list(string), [])
      embeddings = optional(string, "exclude")
      content = optional(object({
        action = string
        merge = object({
          location = string
          name     = string
        })
        }), {
        action = "merge"
        merge = {
          location = "concept"
          name     = "merge"
        }
      })
      }), {
      relations  = []
      embeddings = "exclude"
      content = {
        action = "merge"
        merge = {
          location = "concept"
          name     = "merge"
        }
      }
    })

    parents  = optional(list(object({})), [])
    children = optional(list(object({})), [])
  }))

  description = "List of parents preloads"
  default     = []
}
