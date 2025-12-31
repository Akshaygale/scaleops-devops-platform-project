module "vpc" {
  source = "./terraform/networking"
}

module "alb" {
  source         = "./terraform/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
#   project_name   = var.project_name
#   environment    = var.environment
}
