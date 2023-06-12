resource "aws_security_group" "eks-cluster-sg" {
  name_prefix = "eks_cluster_sg"
  vpc_id      = var.eks-vpc-id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.jump-host-private-ip-to-access-cluster}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf-eks-cluster-secuirty-group"
  }
}
