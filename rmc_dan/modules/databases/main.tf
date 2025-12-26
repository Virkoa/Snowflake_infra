

resource "snowflake_database" "this" {
  for_each = toset(var.database_names)
  name = each.value
}