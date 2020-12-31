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

variable "prefix" {
  type    = bool
  default = false
}

variable "suffix" {
  type    = bool
  default = false
}

variable "azure_account_name" {
  default = ""
}

variable "azure_subscription_id" {
  type    = string
}

variable "azure_client_id" {
  type    = string
}

variable "azure_client_secret" {
  type    = string
}

variable "azure_tenant_id" {
  type    = string
}

variable "azure_transit1_region" {
  default = "East US"
}

variable "azure_transit1_name" {
  default = "ace-azure-us-east-transit"
}

variable "azure_transit1_cidr" {
  default = "10.70.0.0/16"
}

variable "azure_spoke1_region" {
  default = "East US"
}

variable "azure_spoke1_name" {
  default = "ace-azure-us-east-spoke1"
}

variable "azure_spoke1_cidr" {
  default = "10.71.0.0/16"
}

variable "azure_spoke2_region" {
  default = "East US"
}

variable "azure_spoke2_name" {
  default = "ace-azure-us-east-spoke2"
}

variable "azure_spoke2_cidr" {
  default = "10.72.0.0/16"
}

variable azure_fw_size {
  default = "Standard_D3_v2"
}

variable "azure_test_instance_size" {
  type    = string
  default = "Standard_B1ms"
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
