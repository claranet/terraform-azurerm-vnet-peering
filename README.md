# Azure Virtual Network Peering

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/vnet-peering/azurerm/)

Terraform module to generate a [Virtual Network Peering](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)
between two [Virtual Networks](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)
which can belong to two different [Azure Subscriptions](https://docs.microsoft.com/fr-fr/azure/active-directory/fundamentals/active-directory-how-subscriptions-associated-directory).

## Limitations

* Peering between two virtual networks in different tenants isn't possible.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
provider "azurerm" {
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id

  features {}
}
provider "azurerm" {
  alias           = "preprod"
  subscription_id = var.preprod_subscription_id
  tenant_id       = var.azure_tenant_id

  features {}
}

module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "azure_virtual_network" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.resource_group_name

  vnet_cidr   = ["10.10.0.0/16"]
  dns_servers = ["10.0.0.4", "10.0.0.5"] # Can be empty if not used
}

module "azure_vnet_peering" {
  source  = "claranet/vnet-peering/azurerm"
  version = "x.x.x"

  providers = {
    azurerm.src = azurerm
    azurerm.dst = azurerm.preprod
  }

  vnet_src_id  = module.azure_virtual_network.virtual_network_id
  vnet_dest_id = var.virtual_network_id_dest

  allow_forwarded_src_traffic  = true
  allow_forwarded_dest_traffic = true

  allow_virtual_src_network_access  = true
  allow_virtual_dest_network_access = true
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2, >= 1.2.22 |
| azurerm.dst | ~> 3.0 |
| azurerm.src | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.peering_dest](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.peering_src](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurecaf_name.vnet_peering_dst](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |
| [azurecaf_name.vnet_peering_src](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_forwarded\_dest\_traffic | Option allow\_forwarded\_traffic for the dest vnet to peer. Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_forwarded_traffic | `bool` | `false` | no |
| allow\_forwarded\_src\_traffic | Option allow\_forwarded\_traffic for the src vnet to peer. Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_forwarded_traffic | `bool` | `false` | no |
| allow\_gateway\_dest\_transit | Option allow\_gateway\_transit for the dest vnet to peer. Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_gateway_transit | `bool` | `false` | no |
| allow\_gateway\_src\_transit | Option allow\_gateway\_transit for the src vnet to peer. Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_gateway_transit | `bool` | `false` | no |
| allow\_virtual\_dest\_network\_access | Option allow\_virtual\_network\_access for the dest vnet to peer. Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_virtual_network_access | `bool` | `false` | no |
| allow\_virtual\_src\_network\_access | Option allow\_virtual\_network\_access for the src vnet to peer. Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false. https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html#allow_virtual_network_access | `bool` | `false` | no |
| custom\_peering\_dst\_name | Custom name of the vnet peerings to create | `string` | `""` | no |
| custom\_peering\_src\_name | Custom name of the vnet peerings to create | `string` | `""` | no |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name | `string` | `"to"` | no |
| use\_caf\_naming | Use the Azure CAF naming provider to generate default resource name. `custom_rg_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `true` | no |
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
<!-- END_TF_DOCS -->
## Related documentation

Terraform resource documentation: [terraform.io/docs/providers/azurerm/r/virtual_network_peering.html](https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html)

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)
