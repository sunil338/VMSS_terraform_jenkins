output "vmss_id" {
  description = "ID of the VM Scale Set"
  value       = azurerm_linux_virtual_machine_scale_set.example.id
}

output "budget_id" {
  description = "ID of the Budget alert"
  value       = azurerm_consumption_budget_subscription.vmss_budget.id
}

