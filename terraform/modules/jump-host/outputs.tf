
output "jump-host-public-ip" {
  value = aws_instance.jump-host.public_ip
}


output "jump-host-key-name" {
  value = aws_key_pair.tf_key.key_name
}


output "jump-host-private-ip" {
  value = aws_instance.jump-host.private_ip
}
