variable "virtual_network_name" {
  description = "This is virtual network name"
  type = string
}

variable "vnet_location" {
  description = "This is vnet location"
  type = string
}

variable "resource_group_name" {
  description = "This is rg name"
  type = string
}

variable "address_space" {
  description = "This is vnet address space"
  type = list(string)
}