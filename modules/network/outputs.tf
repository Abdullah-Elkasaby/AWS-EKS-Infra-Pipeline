

output "security-group-id" {
  value = aws_security_group.tf-security-group.id
}

output "public-subnets-ids" {
  # value = aws_subnet.public-subnets
  value = [for pub-subnet in aws_subnet.public-subnets : pub-subnet.id]

}


output "private-subnets-ids" {
  # value = aws_subnet.public-subnets
  value = [for private-subnet in aws_subnet.private-subnets : private-subnet.id]

}
