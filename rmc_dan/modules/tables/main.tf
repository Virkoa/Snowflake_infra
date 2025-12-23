resource "snowflake_table" "demo_tab" {
  name      = "DEMO_TABLE"
  database  = var.database_name
  schema    = var.schema_name

  column {
    name = "ID"
    type = "NUMBER"
  }

  column {
    name = "NAME"
    type = "STRING"
  }
}