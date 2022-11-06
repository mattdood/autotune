#######################
# RDS database outputs
#######################

output "parameter_group_arn" {
  description = "Parameter group ARN for the Autotune Postgres RDS instances"
  value = (
    length(aws_db_parameter_group.hybrid) > 0 ? aws_db_parameter_group.hybrid.arn
    : length(aws_db_parameter_group.olap) > 0 ? aws_db_parameter_group.olap.arn
    : length(aws_db_parameter_group.oltp) > 0 ? aws_db_parameter_group.oltp.arn
    : ""
  )
}

output "parameter_group_name" {
  description = "Parameter group name for the Autotune Postgres RDS instances"
  value = (
    length(aws_db_parameter_group.hybrid) > 0 ? aws_db_parameter_group.hybrid.id
    : length(aws_db_parameter_group.olap) > 0 ? aws_db_parameter_group.olap.id
    : length(aws_db_parameter_group.oltp) > 0 ? aws_db_parameter_group.oltp.id
    : ""
  )
}

