# RDS database workload configuration
############################
# This is the paramter tuning for the OLAP style workload for the Postgres module.
# The settings in this parameter group are tuned to high memory usage on a per-connection
# basis with a lower number of allowed connections. The idea behind this is higher
# throughput for each session.
#
# Additionally, drive IOPS are tuned with SSD storage in mind due to the high
# drive throughput of RDS instances on AWS.
#
# References:
#   * Enterprise DB - A great website with information on OLAP and OLTP tuning for
#     different database engines.
#     * URL - https://www.enterprisedb.com/postgres-tutorials/trying-many-hats-how-improve-olap-workload-performance-postgresql
#   * SeveralNines - A brief write up on memory and concurrent worker optimizations
#     for OLAP workloads in Postgres data warehouses
#     * URL - https://severalnines.com/blog/running-data-warehouse-postgresql/

resource "aws_db_parameter_group" "olap" {

  # Memory settings
  ############################

  # Shared buffers (kb) - Stores as much data in the cache as possible to avoid
  # hitting expensive I/O operations on disk
  parameter {
    name         = "shared_buffers"
    value        = floor(var.db_instance_class_memory[var.db_instance_class] / 1024 * 0.25)
    apply_method = "pending-reboot"
  }

  # Effective cache size (kb) - Sets the planner's assumption of the total
  # cache size as a percentage of total memory
  parameter {
    name         = "effective_cache_size"
    value        = floor(var.db_instance_class_memory[var.db_instance_class] / 1024 * 0.65)
    apply_method = "immediate"
  }

  # Work mem (kb) - The total amount of working memory for each session to use
  # in merging and sorting operations. Using `EXPLAIN ANALYZE` will help with
  # finding I/O bottlenecks.
  parameter {
    name         = "work_mem"
    value        = floor(var.db_instance_class_memory[var.db_instance_class] / 1024 * 0.02)
    apply_method = "immediate"
  }

  # Maintenance work mem (kb) - We want VACUUM operations to finish quickly every night,
  # this speeds table maintenance after data loads and helps with index creation.
  parameter {
    name         = "maintenance_work_mem"
    value        = floor(var.db_instance_class_memory[var.db_instance_class] / 1024 * 0.15)
    apply_method = "immediate"
  }

  # TODO: autovacuum_work_mem should be separate than maintenance_work_mem
  # because autovac work mem is set as a num_workers * maint_work_mem unless
  # stated otherwise (15% * 4 workers is too much)

  # CPU settings
  ############################

  # Max worker processes (int) - Maximum number of background processes
  # the system can support
  parameter {
    name         = "max_worker_processes"
    value        = var.db_instance_class_cpu[var.db_instance_class] * 8
    apply_method = "pending-reboot"
  }

  # Max parallel workers per gather (int) - Sets the max number of workers that
  # can be started by a single Gather or Gather Merge node
  parameter {
    name         = "max_parallel_workers_per_gather"
    value        = var.db_instance_class_cpu[var.db_instance_class] * 8 * 0.50
    apply_method = "pending-reboot"
  }

  # Max parallel workers - The max number of workers that the system can support
  # for parallel queries
  parameter {
    name         = "max_parallel_workers"
    value        = var.db_instance_class_cpu[var.db_instance_class] * 8
    apply_method = "pending-reboot"
  }

  # Shared parameters - See description in shared.tf
  ##########################

  dynamic "parameter" {
    for_each = module.shared.shared_settings.logging
    content = {
      name = parameter.value.name
      value = parameter.value.value
      apply_method = parameter.value.apply_method
    }
  }

}
