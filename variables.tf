# username, password and controller_ip is configured in terraform cloud variable section
# this will keep these secure and not part of github code

variable "username" {
  type    = string
  default = ""
}

variable "password" {
  type    = string
  default = ""
}

variable "controller_ip" {
  type    = string
  default = ""
}

variable "azure_transit1_region" {
}

variable "azure_transit1_name" {
}

variable "azure_transit1_cidr" {
}

variable "azure_spoke1_region" {
  type    = string
}

variable "azure_spoke1_name" {
  type    = string
}

variable "azure_spoke1_cidr" {
  type    = string
}

variable "azure_spoke2_region" {
  type    = string
}

variable "azure_spoke2_name" {
  type    = string
}

variable "azure_spoke2_cidr" {
  type    = string
}

variable azure_fw_size {
  default = "Standard_D3_v2"
}

variable "firewall_image" {
  type    = string
  default = "Check Point CloudGuard IaaS Standalone (gateway + management) R80.40 - Bring Your Own License"
  #fw_image = "Check Point CloudGuard IaaS Single Gateway R80.40 - Bring Your Own License" 
}

variable "firewall_image_version" {
  type    = string
  default = "8040.900294.0593"
}

variable "insane" {
  type    = bool
  default = true
}

variable "ha_enabled" {
  type    = bool
  default = false
}

variable "azure_test_vm_rg" {
  type    = string
  default = ""
}

variable "azure_transit_instance_size" {
  type    = string
  default = "Standard_B2ms"
}

variable "azure_spoke_instance_size" {
  type    = string
  default = "Standard_B1ms"
}
