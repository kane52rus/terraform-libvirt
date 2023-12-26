variable "subnets" {
  description = "Network subnet of infrastructure"
  type = list(string)
}
variable "dns_domain" {
  description = "Name of domain"
  type = string
}
variable "dns_enable" {
  description = "Name of domain"
  type = bool
}
variable "nat_mode" {
  description = "Enable NAT"
  type = string
  default = "nat"
}
variable "network_name" {
  description = "Name of network"
  type = string
}