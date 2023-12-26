locals {
  servers = {
    jenkins = {cpu = "1", memory = "2048", ip_address="10.9.9.10"}
    jenkins_agent = {cpu = "1", memory = "1024", ip_address="10.9.9.100"}
  }
}