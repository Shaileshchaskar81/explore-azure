variable "resource_group_location" {
  default     = "centralindia"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "win-vm-aadtest"
  description = "Prefix of the resource name"
}