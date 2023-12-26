# CLOUD INIT
data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}
resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "${var.hostname}-ci.iso"
  user_data = data.template_file.user_data.rendered
}

# SHARED IMAGES
resource "libvirt_volume" "centos8" {
  name   = "basic-centos8"
  source = var.basic_image
}

# INHERIT IMAGES
resource "libvirt_volume" "volume" {
  name           = "${var.hostname}.qcow2"
  base_volume_id = libvirt_volume.centos8.id
}

# VMs
resource "libvirt_domain" "vm" {
  name = var.hostname
  vcpu = var.cpu
  memory = var.memory
  network_interface {
    network_id = var.subnet_id
    hostname = var.hostname
    addresses = [var.ip]
    wait_for_lease = true
  }
  disk {
    volume_id = libvirt_volume.volume.id
  }
  cloudinit = libvirt_cloudinit_disk.commoninit.id
  depends_on = [libvirt_volume.volume]
}