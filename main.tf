module "libvirt_network" {
  source = "./modules/libvirt_network"
  subnets = ["10.9.9.0/24"]
  dns_domain = "kane.prod"
  dns_enable = true
  network_name = "dev"
}

module "libvirt_domains" {
  for_each = local.servers
  source = "./modules/libvirt_domains"
  basic_image = "/home/atabunkin/centos8-libvirt.qcow2"
  hostname = each.key
  cpu = each.value.cpu
  memory = each.value.memory
  ip = each.value.ip_address
  subnet_id = module.libvirt_network.subnet
  depends_on = [module.libvirt_network]
}

resource "local_sensitive_file" "hosts" {
  content = templatefile("${path.module}/inventory.tftpl",
    {
      servers = local.servers,
      groups = local.groups
    })
  filename = "../inventory/kvm.yml"
}