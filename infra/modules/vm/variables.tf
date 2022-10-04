variable "rg_name" {
  type        = string
  description = "resource group name"
}

variable rg_location {
  type        = string
  description = "resource group location"
}

variable vm_name {
  type        = string
  description = "VM Name"
}

variable network_interface_ids {
  type = list(string)
  description = "network interface ids"
}