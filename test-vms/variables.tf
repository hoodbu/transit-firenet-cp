variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
}

variable "controller_ip" {
  type    = string
}

variable "azure_account_name" {
  type    = string
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

