locals {
  dbs     = toset(var.database_name)
  schemas = toset(var.schema_name)

  db_schemas_pairs = {
    for pair in flatten([
      for d in local.dbs : [
        for s in local.schemas : { db = d, schema = s }
      ]
    ]) : "${pair.db}::${pair.schema}" => pair
  }
}


resource "snowflake_schema" "schemas" {
  for_each            = local.db_schemas_pairs
  name                = each.value.schema
  database            = each.value.db
  with_managed_access = false
}

