variable "subnet_name" {
  description = "This is subnat name"
  type = string
}
variable "resource_group_name" {
  description = "This is rg name"
  type = string
}
variable "virtual_network_name" {
  description = "This is virtual network name"
  type = string
}
variable "address_prefixes" {
  description = "This is frontend subnet prifixes"
  type = list(string)
}