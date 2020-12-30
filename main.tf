provider "aviatrix" {

  username                = var.username
  password                = var.password
  controller_ip           = var.controller_ip
  version                 = "2.17"
  skip_version_validation = false
}

# Multi-Cloud Segmentation
resource "aviatrix_segmentation_security_domain" "yellow" {
  domain_name = "yellow"
}

resource "aviatrix_segmentation_security_domain" "indigo" {
  domain_name = "indigo"
}

resource "aviatrix_segmentation_security_domain_connection_policy" "yellow_indigo" {
  domain_name_1 = "yellow"
  domain_name_2 = "indigo"
  depends_on = [aviatrix_segmentation_security_domain.yellow, aviatrix_segmentation_security_domain.indigo]
}

# Azure Transit Module
module "azure_transit_1" {
  source                 = "terraform-aviatrix-modules/azure-transit-firenet/aviatrix"
  version                = "2.0.2"
  ha_gw                  = var.ha_enabled
  cidr                   = var.azure_transit1_cidr
  region                 = var.azure_transit1_region
  account                = var.azure_account_name
  attached               = false
  enable_segmentation    = true
  firewall_image         = var.firewall_image
  firewall_image_version = var.firewall_image_version
  firewall_username      = "admin"
  checkpoint_password    = "Password123!"
}

# Azure Spoke 1 
module "azure_spoke_1" {
  source          = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version         = "2.0.0"
  name            = var.azure_spoke1_name
  cidr            = var.azure_spoke1_cidr
  region          = var.azure_spoke1_region
  account         = var.azure_account_name
  instance_size   = var.azure_spoke_instance_size
  ha_gw           = var.ha_enabled
  security_domain = aviatrix_segmentation_security_domain.indigo.domain_name
  transit_gw      = module.azure_transit_1.transit_gateway.gw_name
}

# Azure Spoke 2
module "azure_spoke_2" {
  source          = "terraform-aviatrix-modules/azure-spoke/aviatrix"
  version         = "2.0.0"
  account         = var.azure_account_name
  region          = var.azure_spoke2_region
  name            = var.azure_spoke2_name
  cidr            = var.azure_spoke2_cidr
  instance_size   = var.azure_spoke_instance_size
  ha_gw           = var.ha_enabled
  security_domain = aviatrix_segmentation_security_domain.indigo.domain_name
  transit_gw      = module.azure_transit_1.transit_gateway.gw_name
}

/* # Create an Aviatrix Transit FireNet Policy
resource "aviatrix_transit_firenet_policy" "transit_firenet_policy1" {
  transit_firenet_gateway_name = aviatrix_transit_gateway.transit_firenet_gw.gw_name
  #inspected_resource_name      = "SPOKE:Spoke-GW-0"
  inspected_resource_name      = "SPOKE:azure-UE-sp1-agw"
  depends_on = [aviatrix_firenet.firewall_net]
}

resource "aviatrix_transit_firenet_policy" "transit_firenet_policy2" {
  transit_firenet_gateway_name = aviatrix_transit_gateway.transit_firenet_gw.gw_name
  #inspected_resource_name      = "SPOKE:Spoke-GW-1"
  inspected_resource_name      = "SPOKE:azure-UE-sp2-agw"
  depends_on = [aviatrix_firenet.firewall_net]
}
 */