// Modify values below as needed
# Aviatrix Controller
#controller_ip = "REPLACE_ME"
#username      = "REPLACE_ME"
#password      = "REPLACE_ME"

# NGFW Variables
# firewall_image         = "Check Point CloudGuard IaaS Single Gateway R80.40 - Bring Your Own License"
# firewall_image_version = "8040.900294.0593"

# Aviatrix Gateway size
# instance_size = "Standard_D3_v2"

# HA flags
# ha_enabled = false

# Azure
# Transit
azure_transit1_region = "East US"
azure_transit1_name   = "az-east-us-tr1"
azure_transit1_cidr   = "192.168.10.0/23"
# Spoke
azure_spoke1_region = "East US"
azure_spoke1_name   = "az-east-us-sp1"
azure_spoke1_cidr   = "192.168.1.0/24"
azure_spoke2_region = "East US"
azure_spoke2_name   = "az-east-us-sp2"
azure_spoke2_cidr   = "192.168.2.0/24"