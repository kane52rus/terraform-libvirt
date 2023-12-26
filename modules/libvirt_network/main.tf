
# NETWORK
resource "libvirt_network" "dev" {
  name = var.network_name
  mode = var.nat_mode
  domain = var.dns_domain
  addresses = var.subnets
  dns {
    enabled = var.dns_enable
  }
}