
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