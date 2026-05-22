module "vpc" {
  source  = "../../modules/vpc"

  env     = var.env
  project = var.project
  vpc_cidr = var.vpc_cidr
}
