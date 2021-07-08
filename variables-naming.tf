variable "custom_peering_src_name" {
  description = "Custom name of the vnet peerings to create"
  type        = string
  default     = ""
}

variable "custom_peering_dst_name" {
  description = "Custom name of the vnet peerings to create"
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name"
  type        = string
  default     = "to"
}

variable "use_caf_naming" {
  description = "Use the Azure CAF naming provider to generate default resource name. `custom_rg_name` override this if set. Legacy default name is used if this is set to `false`."
  type        = bool
  default     = true
}
