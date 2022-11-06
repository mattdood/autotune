#######################
# RDS database shared configuration
#######################
# Logging and extensions are a shared set of parameters to reduce the
# number of times we need to write them.

locals {
  logging_options = {
    "stderr"     = "stderr"
    "csvlog"     = "csvlog,stderr"
    "jsonlog"    = "jsonlog,stderr"
    "verboselog" = "csvlog,jsonlog,stderr"
  }
}

data "aws_db_parameter_group" "shared_settings" {
  logging = [
    {
      # Logging type (stderr, json, csv)
      name         = "log_destination"
      value        = local.logging_options[var.log_type]
      apply_method = "immediate"
    },
    {
      # Log connections to the system
      name         = "log_connections"
      value        = true
      apply_method = "immediate"
    },
    {
      # Log when tables are waiting for exclusive locks to end
      name         = "log_lock_waits"
      value        = true
      apply_method = "immediate"
    },
    {
      # Log statements over X ms in execution time. Default 2000 ms
      name         = "log_min_duration_sample"
      value        = var.log_min_duration_sample
      apply_method = "immediate"
    },
    {
      # Log all DDL changes. Can expose passwords, set up pgaudit extension first
      name         = "log_statement"
      value        = "ddl"
      apply_method = "immediate"
    },
    {
      # Log when temporary files are made on disk for sorts, hashes
      # and temp query results. Can be a sign of high memory pressure
      name         = "log_temp_files"
      value        = 2000 # (kb)
      apply_method = "immediate"
    }
  ]

  query_monitoring = [
    {
      name         = "pg_stat_statements.max"
      value        = var.pg_stat_statements.max
      apply_method = "immediate"
    },
    {
      name         = "pg_stat_statements.save"
      value        = var.pg_stat_statements.save
      apply_method = "immediate"
    },
    {
      name         = "pg_stat_statements.track"
      value        = var.pg_stat_statements.track
      apply_method = "immediate"
    },
    {
      name         = "pg_stat_statements.track_planning"
      value        = var.pg_stat_statements.track_planning
      apply_method = "immediate"
    },
    {
      name         = "pg_stat_statements.track_utility"
      value        = var.pg_stat_statements.track_utility
      apply_method = "immediate"
    },
  ]

  # Requires SQL to be run after DB creation
  # to install extensions
  shared_preload_libraries = [
    # Removes sensitive data from logs
    "pgaudit",
    # Tracks SQL statements for tracking planning and execution statistics
    "pg_stat_statements"
  ]
}

