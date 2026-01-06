locals {
  # extract schemas from db_config
  schemas = flatten([
    for db_name, db in var.db_config.databases : [
      for schema_name, schema in db.schemas : {
        database = db_name
        name     = schema_name
        comment  = schema.comment
      }
    ]
  ])
}


resource "snowflake_schema" "schemas" {
  for_each = {
    for s in local.schemas :
    "${s.database}.${s.name}" => s
  }

  database = each.value.database
  name     = each.value.name
  comment  = each.value.comment
}
