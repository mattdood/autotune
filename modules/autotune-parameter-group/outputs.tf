#######################
# Parameter Group Module Outputs
#######################
# Attempt to dynamically assign the parameter group name based on which module
# was deployed.

output "parameter_group_arn" {
  description = "Parameter group ARN for the Autotune RDS instance"
  value = (
    length(module.autotune-mysql) > 0 ? module.autotune-mysql.parameter_group_arn
    : length(module.autotune-postgresql) > 0 ? module.autotune-postgresql.parameter_group_arn
    : length(module.autotune-sql-server) > 0 ? module.autotune-sql-server.parameter_group_arn
    : ""
  )
}

output "parameter_group_name" {
  description = "Parameter group name for the Autotune RDS instance"
  value = (
    length(module.autotune-mysql) > 0 ? module.autotune-mysql.parameter_group_name
    : length(module.autotune-postgresql) > 0 ? module.autotune-postgresql.parameter_group_name
    : length(module.autotune-sql-server) > 0 ? module.autotune-sql-server.parameter_group_name
    : ""
  )
}

