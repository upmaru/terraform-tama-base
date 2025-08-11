variable "class_names" {
  description = "List of class names to extract nested properties from"
  type        = list(string)
}

variable "space_id" {
  description = "ID of the space"
  type        = string
}

variable "specification_id" {
  description = "ID of the specification"
  type        = string
}

variable "types" {
  default     = ["array"]
  description = "List of types to extract nested properties from can be array, object"
}

variable "depth" {
  default     = 1
  description = "Depth of nested properties to extract"
}

variable "expected_class_names" {
  default     = []
  description = "List of expected class names"
}
