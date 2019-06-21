# Azure Virtual Network Peering

Common Azure module to generate a [Virtual Network Peering](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview) between two  [Virtual Networks](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview).

## Usage

Modify the main.tf

```hcl

provider "azurerm" {
  subscription_id = "${var.azure_subscription_id}"
  tenant_id       = "${var.azure_tenant_id}"
  alias           = "src"
}

provider "azurerm" {
  subscription_id = "${data.terraform_remote_state.support.subscription_id}"
  tenant_id       = "${var.azure_tenant_id}"
  alias           = "dest"
}

```

Add module block following this example

```hcl
module "azure-region" {
  source       = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=vX.X.X"
  azure_region = "${var.azure_region}"
}

module "rg" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=vX.X.X"

  location    = "${module.azure-region1.location}"
  client_name = "${var.client_name}"
  environment = "${var.environment}"
  stack       = "${var.stack1}"
}

module "vnet" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/vnet.git?ref=vX.X.X"

  environment    = "${var.environment}"
  location       = "${module.azure-region.location}"
  location_short = "${module.azure-region.location_short}"
  client_name    = "${var.client_name}"
  stack          = "${var.stack1}"

  resource_group_name = "${module.rg1.resource_group_name}"
  vnet_cidr           = ["10.10.0.0/16"]
}

module "vnet-peering-multisub" {
  source = "//git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/vnet-peering-multisub.git?ref=vX.X.X"

  providers = {
    azurerm.src  = "azurerm.src"
    azurerm.dest = "azurerm.dest"
  }

  vnet_src_id  = "${module.vnet.virtual_network_id}"
  vnet_dest_id = "${data.terraform_remote_state.support.virtual_network_id}"

  vnet_src_name  = "${module.vnet.virtual_network_name}"
  vnet_dest_name = "${data.terraform_remote_state.support.virtual_network_name}"

  vnet_src_rg_name  = "${module.rg.resource_group_name}"
  vnet_dest_rg_name = "${data.terraform_remote_state.support.resource_group_name}"

  allow_forwarded_src_traffic  = "true"
  allow_forwarded_dest_traffic = "true"

  allow_virtual_src_network_access  = "true"
  allow_virtual_dest_network_access = "true"
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow_forwarded_dest_traffic | Option allow_forwarded_traffic for the dest vnet to peer. Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_forwarded_traffic | string | `false` | no |
| allow_forwarded_src_traffic | Option allow_forwarded_traffic for the src vnet to peer. Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_forwarded_traffic | string | `false` | no |
| allow_gateway_dest_transit | Option allow_gateway_transit for the dest vnet to peer. Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_gateway_transit | string | `false` | no |
| allow_gateway_src_transit | Option allow_gateway_transit for the src vnet to peer. Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_gateway_transit | string | `false` | no |
| allow_virtual_dest_network_access | Option allow_virtual_network_access for the dest vnet to peer. Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_virtual_network_access | string | `false` | no |
| allow_virtual_src_network_access | Option allow_virtual_network_access for the src vnet to peer. Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_virtual_network_access | string | `false` | no |
| custom_peering_dest_name | Custom name of the vnet peerings to create | string | `` | no |
| custom_peering_src_name | Custom name of the vnet peerings to create | string | `` | no |
| use_remote_dest_gateway | Option use_remote_gateway for the dest vnet to peer. Controls if remote gateways can be used on the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#use_remote_gateways | string | `false` | no |
| use_remote_src_gateway | Option use_remote_gateway for the src vnet to peer. Controls if remote gateways can be used on the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#use_remote_gateways | string | `false` | no |
| vnet_dest_id | Id of the dest vnet to peer | string | - | yes |
| vnet_dest_name | Name of the dest vnet to peer | string | - | yes |
| vnet_dest_rg_name | Resource group name of the dest vnet to peer | string | - | yes |
| vnet_src_id | Id of the src vnet to peer | string | - | yes |
| vnet_src_name | Name of the src vnet to peer | string | - | yes |
| vnet_src_rg_name | Resource group name of the src vnet to peer | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet_peering_dest_id | Virtual network dest peering id |
| vnet_peering_dest_name | Virtual network dest peering name |
| vnet_peering_src_id | Virtual network src peering id |
| vnet_peering_src_name | Virtual network src peering name 

## Related documentation

Azure vnet peering documentation: https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview

Terraform vnet_peering resource documentation: https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html
