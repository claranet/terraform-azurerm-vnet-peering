# v5. - unreleased

Breaking
  * AZ-495:  Update provider block with provider aliases and avoid warning with Terraform 0.15+

# v4.0.0 - 2021-02-22

Updated
  * AZ-273: Module now compatible terraform `v0.13+` and `v0.14+`

Breaking
  * AZ-273: Provider confugurations must be declared before calling the module (check README example for more info)

# v3.0.0 - 2020-07-29

Breaking
  * AZ-198: Upgrade module AzureRM >= 2.0 + update `tenant_id` variables to be mandatory

# v2.1.3 - 2020-07-29

Fixed
  * AZ-207: Fix README

# v2.1.2 - 2020-03-12

Added
  * [GITHUB-1](https://github.com/claranet/terraform-azurerm-vnet-peering/pull/3): Ability to use different `client_id`'s and `client_secret`'s for source and destination

# v2.1.1 - 2020-03-09

Fixed
  * AZ-206: Pin version of provider AzureRM to be usable under v2.x

# v2.1.0 - 2020-02-17

Added
  * AZ-181: Ability to skip provider registration on source and destination tenants

# v2.0.1 - 2019-11-22

Changed
  * AZ-119: Revamp README and publish this module to Terraform registry

# v2.0.0 - 2019-10-16

Breaking
  * AZ-94: Terraform 0.12 / HCL2 format

Added
  * AZ-118: Add LICENSE, NOTICE & Github badges

# v0.1.0 - 2019-07-12

Added
  * AZ-103: First release
