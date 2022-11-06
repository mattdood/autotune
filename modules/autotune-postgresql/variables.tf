
#######################
# Module workload
#######################
variable "workload_type" {
  type        = string
  description = "Database workload type. Must be one of (`olap`, `oltp`, `hybrid`)"
  validation {
    condition     = contains(["oltp", "olap", "hybrid"], var.workload_type)
    error_message = "Valid values for `var.workload_type` are (oltp, olap, hybrid)"
  }
}

#######################
# Module settings
#######################
variable "log_type" {
  type        = string
  description = "Type and verbosity of log files. CSV, JSON, and stderr provided. Specifying JSON or CSV implies stderr as well (more than doubles log space). Valid options are (stderr, csvlog, jsonlog, verboselog)"
  validation {
    condition     = contains(["stderr", "csvlog", "jsonlog", "verboselog"], var.workload_type)
    error_message = "Valid values for `var.workload_type` are (oltp, olap, hybrid)"
  }
}

variable "log_min_duration_sample" {
  type        = number
  description = "Minimum execution time (ms) for a statement to be logged."
  default     = 2000
}

variable "pg_stat_statements" {
  type        = map(any)
  description = "Settings for pg_stat_statements. Ensure to override **all** of the defaults if you change this setting"
  default = {
    max            = 200
    save           = true
    track          = "TOP"
    track_planning = false
    track_utility  = false
  }
}
