############################
# RDS DB Parameter Group - Workload
############################
variable "workload_type" {
  type        = string
  description = "Database workload type implies the parameter group settings applied. Valid values are one of (`olap`, `oltp`, `hybrid`)"
  validation {
    condition     = contains(["oltp", "olap", "hybrid"], var.workload_type)
    error_message = "Valid values for `var.workload_type` are (`oltp`, `olap`, `hybrid`)"
  }
}

variable "engine" {
  type        = string
  description = "Database engine name to choose a workload for"
  validation {
    condition     = contains(["mysql", "postgres", "sqlserver"], var.engine)
    error_message = "Valid values for `var.workload_type` are (`mysql`, `postgres`, `sqlserver`)"
  }
}

