locals {
  identifier                    = "django app"
  region                        = "eu-west-1"
  ecs_image1                    = "manste/backend:latest"
  ecs_image2                    = "manste/frontend:latest"
  db_username                   = "root"
  db_password                   = "rootpassword"
  db_name                       = "my_database"
  debug                         = "False"
  secret_key                    = "51532362070681831256982003572950"
}