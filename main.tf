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
  source                 = "./modules/eks"
  eks-vpc-id             = module.netowrk-settings.vpc-id
  eks-private-subnet-ids = module.netowrk-settings.private-subnets-ids

}
