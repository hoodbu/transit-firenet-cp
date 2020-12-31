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
  account                = var.azure_account_name
  region                 = var.azure_transit1_region
  name                   = var.azure_transit1_name
  cidr                   = var.azure_transit1_cidr
  prefix                 = var.prefix
  suffix                 = var.suffix
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
  account         = var.azure_account_name
  region          = var.azure_spoke1_region
  name            = var.azure_spoke1_name
  cidr            = var.azure_spoke1_cidr
  prefix          = var.prefix
  suffix          = var.suffix
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
  prefix          = var.prefix
  suffix          = var.suffix
  instance_size   = var.azure_spoke_instance_size
  ha_gw           = var.ha_enabled
  security_domain = aviatrix_segmentation_security_domain.indigo.domain_name
  transit_gw      = module.azure_transit_1.transit_gateway.gw_name
}

/* Need to do the following manually in the UI
Vendor Integration
Editing the FW Rules
Creation of FireNet Spoke Inspection Policy
*/

/* # Create an Aviatrix Transit FireNet Policy (works with resources only, not modules)
resource "aviatrix_transit_firenet_policy" "transit_firenet_policy1" {
  transit_firenet_gateway_name = var.azure_transit1_name
  inspected_resource_name      = "SPOKE:lab-az-ue-sp1-agw"
}

resource "aviatrix_transit_firenet_policy" "transit_firenet_policy2" {
  transit_firenet_gateway_name = var.azure_transit1_name
  inspected_resource_name      = "SPOKE:lab-az-ue-sp2-agw"
}
 */