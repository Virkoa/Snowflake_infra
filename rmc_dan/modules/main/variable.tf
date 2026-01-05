variable "db_config" {
  type        = any
  description = "Database configuration"
}

variable "env" {
  type        = string
  description = "Deployment environment (dev, test, prod)"
}