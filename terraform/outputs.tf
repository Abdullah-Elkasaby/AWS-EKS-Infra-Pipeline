
output "jump-host-public-ip" {
  value = module.jump-host.jump-host-public-ip
}


output "jump-host-key" {
  value = module.jump-host.jump-host-key-name
}

output "eks-cluster-name" {
  value = module.eks-cluster.eks-cluster-name
}


output "current-region-name" {
  value = data.aws_region.current-region.name
}
