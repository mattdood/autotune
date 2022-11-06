#######################
# Parameter Group Module
#######################
# A hack to work around non-dynamic `source` configurations in TF modules.
# We pull in the latest for each database module, then dynamically serve
# the appropriate parameter group to be deployed.

module "autotune-mysql" {
  count = var.engine == "mysql" ? 1 : 0

  source        = "github.com/mattdood/autotune/modules/autotune-mysql"
  workload_type = var.workload_type
}

module "autotune-postgresql" {
  count = var.engine == "postgres" ? 1 : 0

  source        = "github.com/mattdood/autotune/modules/autotune-postgresql"
  workload_type = var.workload_type
}

module "autotune-sql-server" {
  # Handles multiple SQL Server version types (express, enterprise, etc.)
  count = contains(["sqlserver"], var.engine) ? 1 : 0

  source        = "github.com/mattdood/autotune/modules/autotune-sql-server"
  workload_type = var.workload_type
}
