locals {
  admin_public_key = var.public_key
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Linux VMSS
resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                = var.vmss_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard_F2"
  instances           = 1
  admin_username      = var.admin_username

  admin_ssh_key {
    username   = var.admin_username
    public_key = local.admin_public_key
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.internal.id
    }
  }
}

# Get VMSS info
data "azurerm_virtual_machine_scale_set" "example" {
  name                = azurerm_linux_virtual_machine_scale_set.example.name
  resource_group_name = azurerm_resource_group.example.name
}

# Budget alert for VMSS
resource "azurerm_consumption_budget_subscription" "vmss_budget" {
  name            = var.budget_name
  subscription_id = var.subscription_id
  amount          = var.budget_amount
  time_grain      = var.time_grain
  category        = "Cost"

  filter {
    resource_group_name = azurerm_resource_group.example.name
    resource_ids        = [data.azurerm_virtual_machine_scale_set.example.id]
  }

  notification {
    enabled        = true
    operator       = "GreaterThan"
    threshold      = 80
    contact_emails = [var.contact_email]
  }
}

