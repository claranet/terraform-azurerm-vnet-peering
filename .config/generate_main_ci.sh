#!/bin/bash

cat <<EOF > main.tf
provider "azurerm" {
  alias = "src"

  features {}
}

provider "azurerm" {
  alias = "dst"

  features {}
}
EOF
