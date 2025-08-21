variable "ARM_SUBSCRIPTION_ID" {
  description = "ARM_SUBSCRIPTION_ID"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "sunil-vmss-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Japan East"
}

variable "vmss_name" {
  description = "Name of the VM Scale Set"
  type        = string
  default     = "sunil-new-vmss"
}

variable "admin_username" {
  description = "Admin username for VMSS"
  type        = string
  default     = "sunil"
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}

variable "budget_name" {
  description = "Budget alert name"
  type        = string
  default     = "new-vmss-budget"
}

variable "budget_amount" {
  description = "Budget in Rs"
  type        = number
  default     = 50
}

variable "time_grain" {
  description = "Time period for the budget"
  type        = string
  default     = "Monthly"
}

variable "contact_email" {
  description = "Email to receive budget notifications"
  type        = string
}

