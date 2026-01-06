



module "databases" {
    source = "../databases"
    providers = {
        snowflake = snowflake
    }
    db_config = var.db_config
}

module "schemas" {
    source        = "../schemas"
    providers = {snowflake = snowflake }
    db_config = var.db_config
    depends_on    = [module.databases]
}

module "tables" {
    source        = "../tables"
    providers = {snowflake = snowflake }
    db_config = var.db_config
    depends_on    = [module.databases]
}

module "procedures" {
    source        = "../procedures"
    providers = {snowflake = snowflake}
    depends_on    = [module.databases, module.schemas, module.tables]
}
