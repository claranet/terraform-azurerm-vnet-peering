#!/bin/bash

cat <<EOF > main.tf
provider "azurerm" {
  alias = "src"

  features {}
}

provider "azurerm" {
  alias = "dest"

  features {}
}
EOF
