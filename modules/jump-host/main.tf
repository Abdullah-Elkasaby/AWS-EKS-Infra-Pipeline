data "aws_ami" "ubuntu-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] # Canonical official
}

resource "aws_instance" "public-instances" {
  count = length(var.public-instances-subnets-ids)

  vpc_security_group_ids = var.instances-security-group-ids
  subnet_id              = var.public-instances-subnets-ids[count.index]

  ami           = data.aws_ami.ubuntu-ami.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.tf_key.key_name

}

