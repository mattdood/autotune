#######################
# RDS database workload configuration
#######################
# This is the parameter tuning for the OLAP style workload for the Postgres module.
# The settings in this parameter group are tuned to high memory usage on a per-connection
# basis with a lower number of allowed connections. The idea behind this is higher
# throughput for each session.
#
# Additionally, drive IOPS are tuned with SSD storage in mind due to the high
# drive throughput of RDS instances on AWS.
#
# Note: Variables like `DBInstanceClassMemory` don't handle more than a few chained
# math operations. The limit seems to be 1x multiplication and division.
#   Ex:
#     {FormulaVariable*Integer/Integer}         <- Works
#     {FormulaVariable*Integer/Integer/Integer} <- Doesn't work
#
# References:
#   * Enterprise DB - A great website with information on OLAP and OLTP tuning for
#     different database engines.
#     * URL - https://www.enterprisedb.com/postgres-tutorials/trying-many-hats-how-improve-olap-workload-performance-postgresql
#   * SeveralNines - A brief write up on memory and concurrent worker optimizations
#     for OLAP workloads in Postgres data warehouses
#     * URL - https://severalnines.com/blog/running-data-warehouse-postgresql/

resource "aws_db_parameter_group" "olap" {

  # Deploy conditionally based on var.db_parameter_group_type
  count = var.workload_type == "olap" ? 1 : 0

  #######################
  # Memory settings
  #######################

  # Shared buffers (kb) - Stores as much data in the cache as possible to avoid
  # hitting expensive I/O operations on disk
  parameter {
    name         = "shared_buffers"
    value        = "{DBInstanceClassMemory*25/102400}"
    apply_method = "pending-reboot"
  }

  # Effective cache size (kb) - Sets the planner's assumption of the total
  # cache size as a percentage of total memory
  parameter {
    name         = "effective_cache_size"
    value        = "{DBInstanceClassMemory*65/102400}"
    apply_method = "immediate"
  }

  # Work mem (kb) - The total amount of working memory for each session to use
  # in merging and sorting operations. Using `EXPLAIN ANALYZE` will help with
  # finding I/O bottlenecks.
  parameter {
    name         = "work_mem"
    value        = "{DBInstanceClassMemory*2/102400}"
    apply_method = "immediate"
  }

  # Maintenance work mem (kb) - We want VACUUM operations to finish quickly every night,
  # this speeds table maintenance after data loads and helps with index creation.
  parameter {
    name         = "maintenance_work_mem"
    value        = "{DBInstanceClassMemory*15/102400}"
    apply_method = "immediate"
  }

  # TODO: autovacuum_work_mem should be separate than maintenance_work_mem
  # because autovac work mem is set as a num_workers * maint_work_mem unless
  # stated otherwise (15% * 4 workers is too much)

  #######################
  # CPU settings
  #######################

  # Max worker processes (int) - Maximum number of background processes
  # the system can support
  parameter {
    name         = "max_worker_processes"
    value        = "{DBInstanceVCPU*8}"
    apply_method = "pending-reboot"
  }

  # Max parallel workers per gather (int) - Sets the max number of workers that
  # can be started by a single Gather or Gather Merge node
  # vCPU * 8 * 0.5
  parameter {
    name         = "max_parallel_workers_per_gather"
    value        = "{DBInstanceVCPU*4}"
    apply_method = "pending-reboot"
  }

  # Max parallel workers - The max number of workers that the system can support
  # for parallel queries
  parameter {
    name         = "max_parallel_workers"
    value        = "{DBInstanceVCPU*8}"
    apply_method = "pending-reboot"
  }

  #######################
  # Shared parameters - See description in shared.tf
  #######################

  dynamic "parameter" {
    for_each = data.shared_settings.logging
    content = {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = parameter.value.apply_method
    }
  }

  dynamic "parameter" {
    for_each = data.shared_settings.query_monitoring
    content = {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = parameter.value.apply_method
    }
  }
}
