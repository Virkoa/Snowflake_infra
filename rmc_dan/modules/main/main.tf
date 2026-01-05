


resource "snowflake_database" "databases" {
  for_each = local.db_config.databases

  name    = each.key
  comment = each.value.comment
}
