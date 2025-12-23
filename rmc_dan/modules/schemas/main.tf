resource "snowflake_schema" "tf_db_tf_schema" {
  name                = "DEMO_SC"
  database            = var.database_name
  with_managed_access = false
}

