resource "aws_eks_cluster" "fastapi-cluster" {
  name     = "tf-fastapi-cluster"
  role_arn = aws_iam_role.eks-role.arn


  version = "1.23"

  vpc_config {
    subnet_ids = var.eks-private-subnet-ids


    # TO-DO
    # edit to only allow the jump-host
    security_group_ids = [aws_security_group.eks-cluster-sg.id]

    endpoint_private_access = true
    endpoint_public_access  = false
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role.eks-role,
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
}
