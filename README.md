# Azure Virtual Network Peering

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/vnet-peering/azurerm/)

Terraform module to generate a [Virtual Network Peering](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)
between two [Virtual Networks](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)
which can belong to two different [Azure Subscriptions](https://docs.microsoft.com/fr-fr/azure/active-directory/fundamentals/active-directory-how-subscriptions-associated-directory).

## Limitations

* Peering between two virtual networks in different tenants isn't possible.

## Version compatibility

| Module version | Terraform version | AzureRM version |
|----------------|-------------------| --------------- |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
provider "azurerm" {
  alias           = "dst"
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id

  features {}
}
provider "azurerm" {
  alias           = "src"
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id

  features {}
}

module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "azure-virtual-network" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure-region.location
  location_short = module.azure-region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.resource_group_name

  custom_vnet_name = var.custom_vnet_name
  vnet_cidr        = ["10.10.0.0/16"]
  dns_servers      = ["10.0.0.4", "10.0.0.5"] # Can be empty if not used
}

module "azure-vnet-peering" {
  source  = "claranet/vnet-peering/azurerm"
  version = "x.x.x"

  providers = {
    azurerm.src = azurerm.src
    azurerm.dst = azurerm.dst
  }

  vnet_src_id  = module.azure-virtual-network.virtual_network_id
  vnet_dest_id = data.terraform_remote_state.destination_infra.virtual_network_id

  allow_forwarded_src_traffic  = "true"
  allow_forwarded_dest_traffic = "true"

  allow_virtual_src_network_access  = "true"
  allow_virtual_dest_network_access = "true"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_forwarded\_dest\_traffic | Option allow\_forwarded\_traffic for the dest vnet to peer. Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_forwarded_traffic | `bool` | `false` | no |
| allow\_forwarded\_src\_traffic | Option allow\_forwarded\_traffic for the src vnet to peer. Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_forwarded_traffic | `bool` | `false` | no |
| allow\_gateway\_dest\_transit | Option allow\_gateway\_transit for the dest vnet to peer. Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_gateway_transit | `bool` | `false` | no |
| allow\_gateway\_src\_transit | Option allow\_gateway\_transit for the src vnet to peer. Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_gateway_transit | `bool` | `false` | no |
| allow\_virtual\_dest\_network\_access | Option allow\_virtual\_network\_access for the dest vnet to peer. Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_virtual_network_access | `bool` | `false` | no |
| allow\_virtual\_src\_network\_access | Option allow\_virtual\_network\_access for the src vnet to peer. Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_virtual_network_access | `bool` | `false` | no |
| custom\_peering\_dest\_name | Custom name of the vnet peerings to create | `string` | `""` | no |
| custom\_peering\_src\_name | Custom name of the vnet peerings to create | `string` | `""` | no |
| use\_remote\_dest\_gateway | Option use\_remote\_gateway for the dest vnet to peer. Controls if remote gateways can be used on the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#use_remote_gateways | `bool` | `false` | no |
| use\_remote\_src\_gateway | Option use\_remote\_gateway for the src vnet to peer. Controls if remote gateways can be used on the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#use_remote_gateways | `bool` | `false` | no |
| vnet\_dest\_id | ID of the dest vnet to peer | `string` | n/a | yes |
| vnet\_src\_id | ID of the src vnet to peer | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_peering\_dest\_id | Virtual network dest peering id |
| vnet\_peering\_dest\_name | Virtual network dest peering name |
| vnet\_peering\_src\_id | Virtual network src peering id |
| vnet\_peering\_src\_name | Virtual network src peering name |

## Related documentation

Terraform resource documentation: [terraform.io/docs/providers/azurerm/r/virtual_network_peering.html](https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html)

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)
