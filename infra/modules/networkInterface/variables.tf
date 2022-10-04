variable "rg_name" {
  type        = string
  description = "resource group name"
}

variable rg_location {
  type        = string
  description = "resource group location"
}

variable nic_name {
  type        = string
  description = "network interface name"
}

variable subnet_id {
  type        = string
  description = "subnet id"
}