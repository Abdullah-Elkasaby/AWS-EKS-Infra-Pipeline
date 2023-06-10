# RSA key of size 4096 bits
resource "tls_private_key" "jump-host-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "local_file" "private_key_file" {
  content         = tls_private_key.jump-host-key.private_key_pem
  filename        = "key.pem"
  file_permission = "0600"
}


resource "aws_key_pair" "tf_key" {
  key_name   = "jump-host-key"
  public_key = tls_private_key.jump-host-key.public_key_openssh
}
