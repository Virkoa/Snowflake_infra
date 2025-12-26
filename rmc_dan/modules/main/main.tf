module "warehouses" {
    source = "../warehouses"
    providers = {
        snowflake = snowflake
    }
}

module "databases" {
    source = "../databases"
    providers = {
        snowflake = snowflake
 }
    database_names = var.database_names
}

module "schemas" {
    source        = "../schemas"
    providers = {snowflake = snowflake }

    database_name = var.database_names
    schema_name   = var.schema_names
    depends_on    = [module.databases]
}

# module "procedures" {
#     source        = "../procedures"
#     providers = {
#         snowflake = snowflake
#     }
#     database_names = var.database_names
#     schema_names   = var.schema_names
#     depends_on    = [module.databases, module.schemas]
# }


# module "tables" {
#     source        = "../tables"
#         providers = {
#             snowflake = snowflake
#         }
#     database_name = module.databases.database_name
#     schema_name =   module.schemas.schema_name

#     depends_on    = [module.databases, module.schemas]

# }