## 8.0.1 (2025-04-09)

### Bug Fixes

* update AzAPI version constrain ca11de2

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.8 7418d21
* **deps:** update dependency opentofu to v1.9.0 9373f44
* **deps:** update dependency pre-commit to v4.1.0 f6a4b4a
* **deps:** update dependency pre-commit to v4.2.0 bcb5992
* **deps:** update dependency terraform-docs to v0.20.0 6823542
* **deps:** update dependency tflint to v0.55.0 f85f330
* **deps:** update dependency tflint to v0.55.1 2954fa4
* **deps:** update dependency trivy to v0.58.1 065da48
* **deps:** update dependency trivy to v0.58.2 f2ea3b8
* **deps:** update dependency trivy to v0.59.0 068ba1d
* **deps:** update dependency trivy to v0.59.1 532a96c
* **deps:** update dependency trivy to v0.60.0 cf0f6e5
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.20.0 0bbe446
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.21.0 e5a780d
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.22.0 aa75fcc
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.0 7f931d8
* **deps:** update terraform azapi to ~> 2.2.0 ed55d7b
* **deps:** update terraform azapi to ~> 2.3.0 08f4467
* **deps:** update tools 4e75811
* update Github templates d37b59d
* update tflint config for v0.55.0 c5c0592

## 8.0.0 (2024-12-16)

### ⚠ BREAKING CHANGES

* **AZ-1088:** use azapi parse_resource_id function
* **AZ-1088:** module v8 structure and updates

### Features

* **AZ-1088:** module v8 structure and updates 87b2f86
* **AZ-1088:** use azapi parse_resource_id function f3d32fd

### Continuous Integration

* fix CI tfvars f6cafaa
* update provider alias script 5292384

### Miscellaneous Chores

* **AZ-1088:** apply suggestion 6b915eb
* **AZ-1088:** apply suggestions adefcd5
* **deps:** update dependency opentofu to v1.8.3 b080533
* **deps:** update dependency opentofu to v1.8.4 2d918ee
* **deps:** update dependency opentofu to v1.8.6 a708ef6
* **deps:** update dependency pre-commit to v4 3b4ccd2
* **deps:** update dependency pre-commit to v4.0.1 2a20718
* **deps:** update dependency tflint to v0.54.0 73eb314
* **deps:** update dependency trivy to v0.56.1 4e933a5
* **deps:** update dependency trivy to v0.56.2 8872383
* **deps:** update dependency trivy to v0.57.1 42af15f
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.19.0 0373c49
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 a0cea17
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 ac2ea2d
* **deps:** update tools 21a5f2d
* **deps:** update tools 41a6e01
* prepare for new examples structure 7119a77
* update examples structure c9e1730

### Revert

* Revert "feat: use Claranet "azurecaf" provider" 6d363e4

## 7.1.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider 29f9ba0

### Documentation

* update README badge to use OpenTofu registry 10465e4

### Miscellaneous Chores

* **deps:** update dependency terraform-docs to v0.19.0 18843c6
* **deps:** update dependency trivy to v0.55.1 a6c4b80
* **deps:** update dependency trivy to v0.55.2 0182c50
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 62f365c
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 498ff46
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 ee6af7d
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 1d4656e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 5a4c74a
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 04c5192

## 7.0.0 (2024-09-06)

### ⚠ BREAKING CHANGES

* **AZ-840:** minimum TF version `v1.3+`, provider AzureRM `v3.0+`

### Features

* **AZ-840:** prepare v7 3db1099

### Continuous Integration

* add custom before_script for both providers aliases check 911af61
* **AZ-1391:** enable semantic-release [skip ci] c689293
* **AZ-1391:** update semantic-release config [skip ci] 39e9013

### Miscellaneous Chores

* **deps:** enable automerge on renovate 89793c4
* **deps:** update dependency opentofu to v1.7.0 2858773
* **deps:** update dependency opentofu to v1.7.1 72cbf0b
* **deps:** update dependency opentofu to v1.7.2 adec415
* **deps:** update dependency opentofu to v1.7.3 c0f0ec9
* **deps:** update dependency opentofu to v1.8.1 cd92320
* **deps:** update dependency pre-commit to v3.7.1 1662f86
* **deps:** update dependency pre-commit to v3.8.0 8f7bbcc
* **deps:** update dependency terraform-docs to v0.18.0 1571cfc
* **deps:** update dependency tflint to v0.51.0 3c78888
* **deps:** update dependency tflint to v0.51.1 c1bb28d
* **deps:** update dependency tflint to v0.51.2 6104844
* **deps:** update dependency tflint to v0.52.0 8e4241c
* **deps:** update dependency trivy to v0.50.2 7b44ca9
* **deps:** update dependency trivy to v0.50.4 a6109e4
* **deps:** update dependency trivy to v0.51.0 635f199
* **deps:** update dependency trivy to v0.51.1 932d817
* **deps:** update dependency trivy to v0.51.2 5cf9291
* **deps:** update dependency trivy to v0.51.4 ff08e05
* **deps:** update dependency trivy to v0.52.0 96a19b9
* **deps:** update dependency trivy to v0.52.1 2d45711
* **deps:** update dependency trivy to v0.52.2 a2e71c9
* **deps:** update dependency trivy to v0.53.0 9a490b9
* **deps:** update dependency trivy to v0.54.1 7d64f33
* **deps:** update dependency trivy to v0.55.0 1cdd2a5
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 6883fa8
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 3f053bf
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 c01599b
* **deps:** update renovate.json 4fc789b
* **deps:** update tools 71b6cbb
* **deps:** update tools 6558443
* **deps:** update tools 973a15a
* **pre-commit:** update commitlint hook bc55a22
* **release:** remove legacy `VERSION` file b3ba5cc

# v5.1.0 - 2022-11-24

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

# v5.0.2 - 2022-06-20

Changed
  * AZ-572: Revamp examples and improve CI

# v5.0.1 - 2021-08-27

Changed
  * AZ-532: Revamp README with latest `terraform-docs` tool
  * AZ-530: Cleanup module, fix linter errors

# v5.0.0 - 2021-07-08

Breaking
  * AZ-495: Update provider block with provider aliases and avoid warning with Terraform 0.15+
  * AZ-515: Option to use Azure CAF naming provider to name resources

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
