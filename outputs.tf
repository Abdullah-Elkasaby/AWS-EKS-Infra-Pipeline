
output "jump-host-ip" {
  value = module.jump-host.public-ips
}


output "jump-host-key" {
  value = module.jump-host.jump-host-key-name
}
