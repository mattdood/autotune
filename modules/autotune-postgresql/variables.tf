
variable "workload_type" {
  type = string
  description = "Database workload type. Must be one of (`olap`, `oltp`, `hybrid`)"
  validation {
    condition     = contains(["oltp", "olap", "hybrid"], var.workload_type)
    error_message = "Valid values for `var.workload_type` are (oltp, olap, hybrid)"
  }
}
