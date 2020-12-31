// Test Azure RG + VMs

data "template_file" "azure-init" {
  template = "${file("${path.module}/test-vms/azure_bootstrap.sh")}"
}

resource "azurerm_resource_group" "example" {
  name     = "rg-firenet-vms"
  location = var.azure_transit1_region
}

# Test VMs have a dependency on RG. However, in TF 0.12, modules do not support 'depends_on'
# So create RG first with VM code uncommented, then uncomment VM code to run again.


module "azure_test_vm1" {
  source                        = "Azure/compute/azurerm"
  resource_group_name           = azurerm_resource_group.example.name
  vm_hostname                   = "transit-firenet-az-east-us-spoke1-ubu"
  nb_public_ip                  = 1
  remote_port                   = "22"
  vm_os_simple                  = "UbuntuServer"
  vnet_subnet_id                = module.azure_spoke_1.vnet.public_subnets[1].subnet_id
  delete_os_disk_on_termination = true
  custom_data                   = data.template_file.azure-init.rendered
  vm_size                       = var.azure_test_instance_size
  enable_ssh_key                = false
  admin_username                = "ubuntu"
  admin_password                = "Password123!"
  tags = {
    environment = "transit-firenet"
    name        = "transit-firenet-az-east-us-spoke1-ubu"
  }
}

module "azure_test_vm2" {
  source                        = "Azure/compute/azurerm"
  resource_group_name           = azurerm_resource_group.example.name
  vm_hostname                   = "transit-firenet-az-east-us-spoke2-ubu"
  nb_public_ip                  = 1
  remote_port                   = "22"
  vm_os_simple                  = "UbuntuServer"
  vnet_subnet_id                = module.azure_spoke_2.vnet.public_subnets[1].subnet_id
  delete_os_disk_on_termination = true
  custom_data                   = data.template_file.azure-init.rendered
  vm_size                       = var.azure_test_instance_size
  enable_ssh_key                = false
  admin_username                = "ubuntu"
  admin_password                = "Password123!"
  tags = {
    environment = "transit-firenet"
    name        = "transit-firenet-az-east-us-spoke2-ubu"
  }
}

