module "netowrk-settings" {
  source                      = "./modules/network"
  public-subnets-cidr-blocks  = var.public-subnets
  private-subnets-cidr-blocks = var.private-subnets
  zones                       = var.availability-zones


}
