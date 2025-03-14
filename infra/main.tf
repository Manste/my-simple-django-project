module "vpc" {
  source                        = "git@github.com:Manste/Terraform-modules.git//vpc"
  az_count                      = 2
}

module "alb" {
  source                        = "git@github.com:Manste/Terraform-modules.git//loadbalancer"
  region                        = local.region
  vpc_id                        = module.vpc.vpc_id
  public_subnet_ids             = module.vpc.public_subnets
  identifier                    = local.identifier
}

module "fargate" {
  source                        = "git@github.com:Manste/Terraform-modules.git//fargate"
  identifier                    = local.identifier
  region                        = local.region
  private_subnet_ids            = module.vpc.private_subnets
  target_group_arn              = module.alb.loadbalancer_target_group_arn
  target_group_backend_arn      = module.alb.loadbalancer_target_group_backend_arn
  vpc_id                        = module.vpc.vpc_id
  ecs_image1                    = local.ecs_image1
  ecs_image2                    = local.ecs_image2
  MONGO_INITDB_ROOT_USERNAME    = local.db_username 
  MONGO_INITDB_ROOT_PASSWORD    = local.db_password
  MONGO_INITDB_DATABASE         = local.db_name
  SECRET_KEY                    = local.secret_key 
  DEBUG                         = local.debug 
  alb_security_groups           = module.alb.loadbalancer_security_groups
  DATABASE_URL                  = "mongodb://${local.db_username}:${local.db_password}@mongodb:27017/${local.db_name}?authSource=admin"
  ALLOWED_HOSTS                 = "localhost 127.0.0.1 ${module.alb.lb_url}"
  REACT_APP_API_URL             = "http://${module.alb.lb_url}:8000"

}