#
# Copyright 2023 Emmanuel Bergerat
#

# Created  on: 2023-06-20
# Created  by: Emmanuel
# Modified on: 
# Modified by: 
# Overview:
#   This Application Insights module:
#   - ,
#   - .
#

# -
# - Generate base for the Application Insights Resource
# -
module "appins_base" {
  # Terraform Cloud PMR use
  source  = "app.terraform.io/embergertf/base/azurerm"
  version = "~>3.0.0"

  name_override = var.name_override

  region_code     = var.region_code
  subsc_code      = var.subsc_code
  env             = var.env
  base_name       = var.base_name
  additional_name = var.additional_name
  iterator        = var.iterator
  owner           = var.owner

  # Resource Group specifics settings
  resource_type_code = "appins"
  max_length         = 90
  no_dashes          = false
  add_random         = var.add_random
  rnd_length         = var.rnd_length
}

# -
# - Create the Application Insights Resource
# -
resource "azurerm_resource_group" "this" {
  name     = module.appins_base.name
  location = module.appins_base.location

  tags = merge(module.appins_base.tags, var.additional_tags)
}

