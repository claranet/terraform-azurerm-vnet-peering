variable "src_custom_name" {
  description = "Custom name of the vnet peerings to create."
  type        = string
  default     = ""
}

variable "dst_custom_name" {
  description = "Custom name of the vnet peerings to create."
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Optional prefix for the generated name."
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name."
  type        = string
  default     = "to"
}
