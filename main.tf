module "netowrk-settings" {
  source                      = "./modules/network"
  public-subnets-cidr-blocks  = var.public-subnets
  private-subnets-cidr-blocks = var.private-subnets
  zones                       = var.availability-zones

}

module "jump-host" {
  source                       = "./modules/jump-host"
  instances-security-group-ids = [module.netowrk-settings.security-group-id]
  public-instances-subnets-ids = module.netowrk-settings.public-subnets-ids

}

module "eks-cluster" {
  source                                 = "./modules/eks"
  eks-vpc-id                             = module.netowrk-settings.vpc-id
  eks-private-subnet-ids                 = module.netowrk-settings.private-subnets-ids
  jump-host-private-ip-to-access-cluster = module.jump-host.jump-host-private-ip

}


# resource "local_file" "info" {
#   filename = "ansible/cluster-info.txt"
#   content  = <<-EOF
#         cluster_name=${module.eks-cluster.eks-cluster-name}
#         jump_host_ip=${module.jump-host.jump-host-public-ip}
#         jump_host_key_name=${module.jump-host.jump-host-key-name}
#       EOF
# }

resource "null_resource" "add-jump-host-ip-to-anisble-inventory" {
  provisioner "local-exec" {
    command     = "echo ${module.jump-host.jump-host-public-ip} >> inventory"
    working_dir = "ansible/"
  }

}
