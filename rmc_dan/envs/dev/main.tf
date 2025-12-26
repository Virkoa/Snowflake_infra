

module "main" {
  source = "../../modules/main"
  providers = {
    snowflake = snowflake
    }
  env = var.env
}

