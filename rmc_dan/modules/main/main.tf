
module "databases" {
    source = "../databases"
    providers = {
        snowflake = snowflake
  }
}

module "warehouses" {
    source = "../warehouses"
    providers = {
        snowflake = snowflake
    }
}

module "schemas" {
    source        = "../schemas"
        providers = {
            snowflake = snowflake
        }
    database_name = module.databases.database_name
    depends_on    = [module.databases]

}


module "tables" {
    source        = "../tables"
        providers = {
            snowflake = snowflake
        }
    database_name = module.databases.database_name
    schema_name =   module.schemas.schema_name

    depends_on    = [module.databases, module.schemas]

}