
resource "snowflake_procedure_sql" "sp_ret_msg" {
  database = "RMC_DB"   # or reference from your loop
  schema   = "GOLD"     # or reference from your loop
  name      = "SP_RETURN_MESSAGE"

  return_type          = "VARCHAR(100)"
  procedure_definition = <<EOT
BEGIN
  RETURN message;
END;
EOT
}