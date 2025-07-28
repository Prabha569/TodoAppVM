variable "network_interface_name"{
 description = "This is network interface name"
type = string
}
variable "nic_location" {
  description = "This is nic location"
  type = string
}
variable "resource_group_name" {
  description = "This is rg name"
  type = string
}
variable "virtual_machine_name" {
  description = "This is virtual machine name"
  type = string
}
variable "vm_location" {
  description = "This is vm location"
  type = string
}
variable "vm_size" {
  description = "This is vm size"
  type = string
}
variable "vm_admin_username" {
  description = "This is vm admin username"
  type =  string
}
variable "vm_admin_password" {
  description = "This is vm admin password"
  type = string
}
variable "disable_password_authentication" {
  description = "This is password authentication"
  type = string
}
variable "image_publisher" {
  description = "This is vm image publisher"
  type = string
}
variable "image_offer" {
  description = "This is vm image offer"
  type = string
}
variable "image_sku" {
  description = "Thisi is vm image sku"
  type = string
}
variable "image_version" {
  description = "This is image version"
  type = string
}
variable "data_subnet_name" {
  description = "This is data subnet name"
  type = string
}
variable "virtual_network_name" {
  description = "This is virtual network name"
  type = string
}
variable "data_public_ip_name" {
  description = "This id  data public ip name"
  type = string
}