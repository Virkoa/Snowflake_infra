locals {
  tables = merge([
    for db_name, db in var.db_config.databases : merge([
      for schema_name, schema in db.schemas : {
        for table_name, table in schema.tables :
        "${db_name}.${schema_name}.${table_name}" => {
          database = db_name
          schema   = schema_name
          name     = table_name
          comment  = try(table.comment, null)
          columns  = table.columns
        }
      }
    ]...)
  ]...)
}

resource "snowflake_table" "tables" {
  for_each = local.tables

  database = each.value.database
  schema   = each.value.schema
  name     = each.value.name
  comment  = each.value.comment

  dynamic "column" {
    for_each = each.value.columns
    content {
      name     = column.value.name
      type     = column.value.type
      nullable = try(column.value.nullable, true)
    }
  }
}

