# variable "win_os_image" {
#   type        = string
#   default     = "2016-Datacenter"
#   description = "VM os"
# }

variable "rg_name" {
  type        = string
  description = "rg name"
}

variable "vm_pwd" {
  type        = string
  description = "VM password"
}