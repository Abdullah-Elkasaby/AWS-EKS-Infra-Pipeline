resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.fastapi-cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.nodes-iam-role.arn
  subnet_ids      = var.eks-private-subnet-ids
  instance_types  = ["t2.medium"]

  scaling_config {
    min_size     = 1
    desired_size = 2
    max_size     = 3
  }

  # changed version because of docker-run-time
  version = "1.23"

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
