resource "random_name" "rg_name" {
  prefix = var.rgname_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name = random_name.rg_name.ID
}

# Create Virtual Network
resource "azurerm_virtual_network" "terraform_network" {
  name = "myvnet466"
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}