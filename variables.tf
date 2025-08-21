variable "ARM_SUBSCRIPTION_ID" {
  description = "ARM_SUBSCRIPTION_ID"
  type        = string
  default     = "34a1c0d5-ab81-462c-89db-795e1572cd70"
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
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqD0qL6OVHFfd05XXWGgIhzKyBtFf2MC723dbICQahXOWMus2rj94v/TGJInWfyBOlpmgdFRdt6UY/Yy6c8/75bK17lJxneuEx6+QM2ZWxbmvd+uyRsqKl0t6WGRsYVwTdJaNf4E4auV8g/jEvmzKvxJW0pkmTo2ZriZhlZMg+lQXOi73J5CiJYlIVhshS58fbjKZOLTp0aqJ5vCOzFKmfPcJpOdjJph7THlml6K5KtYqkpH5gBBLiw4jqevZd60pFcGzwO9VwsnBT6O56LyfqM2IHiLUbOZ6IUQT7JZHm0Z2j5SbvvqJkCTzDdTclV+lO7KtE8UtwtX8bYKKu0U3f48lIcczv9e1mxc1JNdYsfrg4LzrPLmvIDUDcxgT1XqhflEX9COH7UsSWKnM9wXKmGS2GoBmrMtY7izcZ9aGiGPEtf5vVPS/Tk/N4CrlvgWZMvNn+Nt1Nr5AXH3BizdUv/FdSA/7V3Q5L5kQTicb6qXzxnpsSG3Ie510B2HRaHTU= sunil@ubuntu"
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
  default     = "ssmuradi115@gmail.com"
}

