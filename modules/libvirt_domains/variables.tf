variable "basic_image" {
  description = "Basic image"
  type = string
}
variable "subnet_id" {
  description = "Network subnet of infrastructure"
  type = string
}
variable "hostname" {
  description = "Hostname of domain"
  type = string
}
variable "cpu" {
  description = "Count of cpu for domain"
  type = string
}
variable "memory" {
  description = "Count of memory for domain"
  type = string
}
variable "ip" {
  description = "IP Address for domain"
  type = string
}