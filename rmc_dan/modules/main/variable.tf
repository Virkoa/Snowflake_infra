variable "db_schema_map" {
  type = map(map(object({
    procs  = list(string)
    tables = list(string)
  })))
  default = {
    RMC_DB = {
      SOT        = { procs = ["demo_proc"], tables = ["table1"] }
      STG        = { procs = [], tables = [] }
      RAW        = { procs = [], tables = [] }
      STREAMLIT  = { procs = [], tables = [] }
    }
    HME_DB = {
      SOT = { procs = [], tables = [] }
      STG = { procs = [], tables = [] }
      RAW = { procs = [], tables = [] }
    }
  }
}