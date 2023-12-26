variable "basic_image" {
  description = "Basic image"
  type = string
  default = "/home/atabunkin/centos8-libvirt.qcow2"
}
variable "subnets" {
  description = "Network subnet of infrastructure"
  type = list(string)
  default = ["10.9.9.0/24"]
}
#variable "hostname" {
#  description = "Hostname of domain"
#  type = string
#}
#variable "cpu" {
#  description = "Count of cpu for domain"
#  type = string
#}
#variable "memory" {
#  description = "Count of memory for domain"
#  type = string
#}
#variable "ip" {
#  description = "IP Address for domain"
#  type = string
#}