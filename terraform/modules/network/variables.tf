

variable "vpc-cidr" {
  description = "the vpc cidr_block "
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc-tags" {
  description = "tags that are assigned to a vpc"
  type        = map(string)
  default = {
    "Name" = "cluster-vpc"
  }
}

variable "igw-tags" {
  type = map(string)
  default = {
    "Name" = "cluster-internet-gateway"
  }
}


variable "public-subnets-cidr-blocks" {
  description = "public subnets cidr_blocks"
  type        = list(any)

}


variable "private-subnets-cidr-blocks" {
  description = "private subnets cidr_blocks"
  type        = list(any)

}

variable "zones" {
  description = "list of availability zones"
  type        = list(any)

}

