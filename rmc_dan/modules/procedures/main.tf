
locals {
  rmc_db = [for s in var.database_names : s if s == "RMC_DB"][0]
  sot_schema = [for s in var.schema_names : s if s == "SOT"][0]

}

resource "snowflake_procedure_sql" "proc" {
	name        = "demo_procedure"
	database    = local.rmc_db
	schema      = local.sot_schema

    comment =  "Created by Terraform module"
        arguments {
        arg_data_type = "VARCHAR(100)"
        arg_name      = "x"
    }

    return_type          = "VARCHAR(100)"
    procedure_definition = <<EOT
    BEGIN
    RETURN message;
    END;
    EOT
}
