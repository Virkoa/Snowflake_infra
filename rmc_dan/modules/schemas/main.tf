# resource "snowflake_schema" "tf_db_tf_schema" {
#   name                = "DEMO_SC"
#   database            = snowflake_database.tf_db.name
#   with_managed_access = false
# }