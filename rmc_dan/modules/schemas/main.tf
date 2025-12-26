locals {
  db_schemas_pairs = merge([
    for db_name, schemas in var.db_schema_map : {
      for schema_name, _ in schemas :
      "${db_name}.${schema_name}" => {
        database = db_name
        schema   = schema_name
      }
    }
  ]...)
}


resource "snowflake_schema" "this" {
  for_each = local.db_schemas_pairs
  name     = each.value.schema
  database = each.value.database
}