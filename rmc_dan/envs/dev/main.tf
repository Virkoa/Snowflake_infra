
locals {
  db_config = yamldecode(file("${path.module}/database.yaml"))
}


module "main" {
  source = "../../modules/main"
  providers = {
    snowflake = snowflake
    }
  env = var.env
  db_config = local.db_config
}

