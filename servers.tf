locals {
  servers = {
    pg_01= {cpu = "1", memory = "1024", ip_address="10.9.9.10", group="pgsql"}
    pg_02 = {cpu = "1", memory = "1024", ip_address="10.9.9.11", group="pgsql"}
    pg_03 = {cpu = "1", memory = "1024", ip_address="10.9.9.12", group="pgsql"}
    etcd_01 = {cpu = "1", memory = "1024", ip_address="10.9.9.20", group="etcd"}
    haproxy_01 = {cpu = "1", memory = "1024", ip_address="10.9.9.30", group="haproxy"}
  }
  groups = distinct([for k,v in local.servers : v.group])

}