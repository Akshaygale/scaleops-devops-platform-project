# module "vpc" {
#   source = "./networking"
# }

# module "alb" {
#   source         = "./alb"
#   vpc_id         = module.vpc.vpc_id
#   public_subnets = module.vpc.public_subnets
# #   project_name   = var.project_name
# #   environment    = var.environment
# }


# module "ecr" {
#   source = "./terraform/ecr"
# }

