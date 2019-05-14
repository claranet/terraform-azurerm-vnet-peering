# Azure Virtual Network Peering

Common Azure module to generate a [Virtual Network Peering](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview) between two  [Virtual Networks](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview).

## Usage

```hcl
module "azure-region" {
  source       = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=vX.X.X"
  azure_region = "${var.azure_region}"
}

module "rg1" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=vX.X.X"

  location    = "${module.azure-region1.location}"
  client_name = "${var.client_name}"
  environment = "${var.environment}"
  stack       = "${var.stack1}"
}

module "rg2" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=vX.X.X"

  location    = "${module.azure-region2.location}"
  client_name = "${var.client_name}"
  environment = "${var.environment}"
  stack       = "${var.stack2}"
}

module "vnet1" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/vnet.git?ref=vX.X.X"

  environment    = "${var.environment}"
  location       = "${module.azure-region.location}"
  location_short = "${module.azure-region.location_short}"
  client_name    = "${var.client_name}"
  stack          = "${var.stack1}"

  resource_group_name = "${module.rg1.resource_group_name}"
  vnet_cidr           = ["10.10.0.0/16"]
}

module "vnet2" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/vnet.git?ref=vX.X.X"

  environment    = "${var.environment}"
  location       = "${module.azure-region.location}"
  location_short = "${module.azure-region.location_short}"
  client_name    = "${var.client_name}"
  stack          = "${var.stack2}"

  resource_group_name = "${module.rg2.resource_group_name}"
  vnet_cidr           = ["10.11.0.0/16"]
}

module "vnet-peering" {
  source = "git@git.fr.clara.net:claranet/cloudnative/projects/cloud/azure/terraform/modules/vnet-peering.git?ref=vX.X.X"

  vnet_ids       = ["${module.vnet1.virtual_network_id}", "${module.vnet2.virtual_network_id}"]
  vnet_names     = ["${module.vnet1.virtual_network_name}", "${module.vnet2.virtual_network_name}"]
  vnet_rgs_names = ["${module.rg1.resource_group_name}", "${module.rg2.resource_group_name}"]
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow\_forwarded\_traffic | Option allow_forwarded_traffic for the 2 vnets to peer. Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_forwarded_traffic | list | `<list>` | no |
| allow\_gateway\_transit | Option allow_gateway_transit for the 2 vnets to peer. Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_gateway_transit | list | `<list>` | no |
| allow\_virtual\_network\_access | Option allow_virtual_network_access for the 2 vnets to peer. Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_virtual_network_access | list | `<list>` | no |
| custom\_peering\_names | Custom names of the vnet peerings to create | list | `<list>` | no |
| use\_remote\_gateways | Option use_remote_gateways for the 2 vnets to peer. Controls if remote gateways can be used on the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#use_remote_gateways | list | `<list>` | no |
| vnet\_ids | Ids of the 2 vnets to peer | list | n/a | yes |
| vnet\_names | Names of the 2 vnets to peer | list | n/a | yes |
| vnet\_rgs\_names | Resource group names of the 2 vnets to peer | list | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_peering\_ids | Virtual network peering ids |
| vnet\_peering\_names | Virtual network peering names |

## Related documentation

Azure vnet peering documentation: https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview

Terraform vnet_peering resource documentation: https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html
