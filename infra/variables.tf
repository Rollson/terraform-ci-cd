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

variable vnet_name {
  type        = string
  description = "Vnet name"
}

variable subnet_name {
  type        = string
  description = "Subnet name"
}

variable nic_name {
  type        = string
  description = "network interface name"
}

variable admin_password {
  type        = string
  description = "vm password"
}

variable admin_username {
  type        = string
  description = "vm password"
}