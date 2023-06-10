output "public-instances-ids" {
  value = [for instance in aws_instance.public-instances : instance.id]

}



output "public-ips" {
  value = [for instance in aws_instance.public-instances : instance.public_ip]
}

