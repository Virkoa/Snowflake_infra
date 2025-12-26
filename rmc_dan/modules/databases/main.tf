

resource "snowflake_database" "databases" {
  for_each      = toset(var.database_names)
  name          = each.value
  is_transient  = false
}