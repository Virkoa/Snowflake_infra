terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

locals {
  organization_name = "scfnxvy"
  account_name      = "qt66354"
  private_key_path  = "~/.ssh/snowflake_tf_snow_key.p8"
}

provider "snowflake" {
    organization_name = local.organization_name
    account_name      = local.account_name
    user              = "TERRAFORM_SVC"
    role              = "SYSADMIN"
    authenticator     = "SNOWFLAKE_JWT"
    private_key       = file(local.private_key_path)
    preview_features_enabled = ["snowflake_table_resource", "snowflake_procedure_sql_resource"]

}
