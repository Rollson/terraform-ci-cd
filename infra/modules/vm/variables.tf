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

variable admin_password {
  type        = string
  description = "vm password"
}

variable admin_username {
  type        = string
  description = "vm password"
}