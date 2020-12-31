// Test Azure RG + VMs

data "template_file" "azure-init" {
  template = "${file("${path.module}/azure-vm-config/azure_bootstrap.sh")}"
}

resource "azurerm_resource_group" "example" {
  name     = "ace-ops-rg"
  location = var.azure_spoke1_region
}

# module "azure_test_vm1" {
#   source                        = "Azure/compute/azurerm"
#   resource_group_name           = azurerm_resource_group.example.name
#   vm_hostname                   = "avxtestvm1"
#   nb_public_ip                  = 1
#   remote_port                   = "22"
#   vm_os_simple                  = "UbuntuServer"
#   vnet_subnet_id                = module.azure_spoke_1.vnet.public_subnets[1].subnet_id
#   delete_os_disk_on_termination = true
#   custom_data                   = data.template_file.azure-init.rendered
#   vm_size                       = var.azure_test_instance_size
#   enable_ssh_key                = false
#   admin_username                = "ubuntu"
#   admin_password                = "Password123!"
#   tags = {
#     environment = "ace-ops"
#     name        = "aviatrix-test-vm1"
#   }
# }

# module "azure_test_vm2" {
#   source                        = "Azure/compute/azurerm"
#   resource_group_name           = azurerm_resource_group.example.name
#   vm_hostname                   = "avxtestvm2"
#   nb_public_ip                  = 1
#   remote_port                   = "22"
#   vm_os_simple                  = "UbuntuServer"
#   vnet_subnet_id                = module.azure_spoke_2.vnet.public_subnets[1].subnet_id
#   delete_os_disk_on_termination = true
#   custom_data                   = data.template_file.azure-init.rendered
#   vm_size                       = var.azure_test_instance_size
#   enable_ssh_key                = false
#   admin_username                = "ubuntu"
#   admin_password                = "Password123!"
#   tags = {
#     environment = "ace-ops"
#     name        = "aviatrix-test-vm2"
#   }
# }
