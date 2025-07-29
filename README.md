# Azure Virtual Network Peering

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/vnet-peering/azurerm/)

Terraform module to generate a [Virtual Network Peering](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)
between two [Virtual Networks](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)
which can belong to two different [Azure Subscriptions](https://docs.microsoft.com/fr-fr/azure/active-directory/fundamentals/active-directory-how-subscriptions-associated-directory).

## Limitations

* Peering between two virtual networks in different tenants isn't possible.
* Subnet peering needs feature registration `Microsoft.Network/AllowSubnetPeering` to be enabled in the destination subscription.
  * `az feature register --namespace Microsoft.Network --name AllowMultiplePeeringLinksBetweenVnets`

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

module "azure_virtual_network" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.name

  cidrs       = ["10.10.0.0/16"]
  dns_servers = ["10.0.0.4", "10.0.0.5"] # Can be empty if not used
}

module "azure_vnet_peering" {
  source  = "claranet/vnet-peering/azurerm"
  version = "x.x.x"

  providers = {
    azurerm.src  = azurerm
    azurerm.dest = azurerm.preprod
  }

  src_virtual_network_id  = module.azure_virtual_network.id
  dest_virtual_network_id = var.virtual_network_id_dest

  src_forwarded_traffic_allowed  = true
  dest_forwarded_traffic_allowed = true

  src_virtual_network_access_allowed  = true
  dest_virtual_network_access_allowed = true
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm.dest | ~> 4.0 |
| azurerm.src | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.dest](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurecaf_name.dst](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |
| [azurecaf_name.src](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dest\_forwarded\_traffic\_allowed | Controls if forwarded traffic from VMs in the remote virtual network is allowed. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_forwarded_traffic-1). | `bool` | `false` | no |
| dest\_gateway\_transit\_allowed | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_gateway_transit-1). | `bool` | `false` | no |
| dest\_subnet\_names | A list of remote subnet names that are peered with the Virtual Network. [See documentation](https://learn.microsoft.com/en-us/azure/virtual-network/how-to-configure-subnet-peering) | `list(string)` | `[]` | no |
| dest\_virtual\_network\_access\_allowed | Controls if the VMs in the remote virtual network can access VMs in the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_virtual_network_access-1). | `bool` | `false` | no |
| dest\_virtual\_network\_id | ID of the destination Virtual Network to peer. | `string` | n/a | yes |
| dst\_custom\_name | Custom name of the vnet peerings to create. | `string` | `""` | no |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `"to"` | no |
| src\_custom\_name | Custom name of the vnet peerings to create. | `string` | `""` | no |
| src\_forwarded\_traffic\_allowed | Controls if forwarded traffic from VMs in the remote virtual network is allowed. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_forwarded_traffic-1). | `bool` | `false` | no |
| src\_gateway\_transit\_allowed | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_gateway_transit-1). | `bool` | `false` | no |
| src\_subnet\_names | A list of local subnet names that are peered with remote Virtual Network. [See documentation](https://learn.microsoft.com/en-us/azure/virtual-network/how-to-configure-subnet-peering) | `list(string)` | `[]` | no |
| src\_virtual\_network\_access\_allowed | Controls if the VMs in the remote virtual network can access VMs in the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#allow_virtual_network_access-1). | `bool` | `false` | no |
| src\_virtual\_network\_id | ID of the source Virtual Network to peer. | `string` | n/a | yes |
| use\_dest\_remote\_gateway | Controls if remote gateways can be used on the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#use_remote_gateways-1). | `bool` | `false` | no |
| use\_src\_remote\_gateway | Controls if remote gateways can be used on the local virtual network. [See documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering.html#use_remote_gateways-1). | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| dest\_id | Destination Virtual network peering id. |
| dest\_name | Destination Virtual network peering name. |
| id | Source Virtual network peering id. |
| name | Source Virtual network peering name. |
| resource | Virtual network peering resource object. |
| resource\_dest | Destination Virtual network peering resource object. |
<!-- END_TF_DOCS -->
## Related documentation

Terraform resource documentation: [terraform.io/docs/providers/azurerm/r/virtual_network_peering.html](https://www.terraform.io/docs/providers/azurerm/r/virtual_network_peering.html)

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)
