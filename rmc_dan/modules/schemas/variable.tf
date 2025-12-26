variable "db_schema_map" {
  type = map(map(object({
    procs  = list(string)
    tables = list(string)
  })))
}