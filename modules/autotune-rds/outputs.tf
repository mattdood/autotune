#######################
# RDS instance outputs
#######################
output "address" {
  description = "RDS hostname"
  value       = aws_db_instance.autotune-rds.address
}

output "arn" {
  description = "ARN of the RDS instance"
  value       = aws_db_instance.autotune-rds.arn
}

output "availability_zone" {
  description = "RDS availability zone"
  value       = aws_db_instance.autotune-rds.availability_zone
}

output "backup_retention_period" {
  description = "RDS backup retention period"
  value       = aws_db_instance.autotune-rds.backup_retention_period
}

output "backup_window" {
  description = "RDS backup window"
  value       = aws_db_instance.autotune-rds.backup_window
}

output "ca_cert_identifier" {
  description = "CA certificate for the DB instance"
  value       = try(aws_db_instance.autotune-rds.ca_cert_identifier, "")
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.autotune-rds.db_name
}

output "domain" {
  description = "ID of the Directory Service Active Directory domain the instance is joined to"
  value       = try(aws_db_instance.autotune-rds.domain, "")
}

output "domain_iam_role_name" {
  description = "IAM role name for making API calls to the Directory Service"
  value       = try(aws_db_instance.autotune-rds.domain_iam_role_name, "")
}

output "endpoint" {
  description = "Endpoint of the Postgres database instance"
  value       = aws_db_instance.autotune-rds.endpoint
}

output "engine_version_actual" {
  description = "RDS actual engine version"
  value       = aws_db_instance.autotune-rds.engine_version_actual
}

output "hosted_zone_id" {
  description = "RDS hosted zone ID"
  value       = aws_db_instance.autotune-rds.hosted_zone_id
}

output "id" {
  description = "RDS instance ID"
  value       = aws_db_instance.autotune-rds.id
}

output "instance_class" {
  description = "RDS instance class"
  value       = aws_db_instance.autotune-rds.instance_class
}

output "latest_restorable_time" {
  description = "Latest time in UTC RFC33399 format a database can be restored with point-in-time restore"
  value       = try(aws_db_instance.autotune-rds.latest_restorable_time, "")
}

output "maintenance_window" {
  description = "The instance maintenance window"
  value       = aws_db_instance.autotune-rds.maintenance_window
}

output "multi_az" {
  description = "If the RDS is multi AZ enabled"
  value       = aws_db_instance.autotune-rds.multi_az
}

output "name" {
  description = "Name of the created database"
  value       = aws_db_instance.autotune-rds.name
}

output "port" {
  description = "Port of the created database"
  value       = aws_db_instance.autotune-rds.port
}

output "resource_id" {
  description = "Resource ID of the RDS instance"
  value       = aws_db_instance.autotune-rds.port
}

output "autotune_rds_tags_all" {
  description = "Resource tags map of the RDS instance"
  value       = aws_db_instance.autotune-rds.tags_all
}

output "username" {
  description = "Master database username"
  value       = aws_db_instance.autotune-rds.username
}

output "character_set_name" {
  description = "Character set (collation) used in Oracle and MSSQL instances"
  value       = try(aws_db_instance.autotune-rds.character_set_name, "")
}

#######################
# CloudWatch logging outputs
#######################
output "cloudwatch_kms_arn" {
  description = "RDS instance CloudWatch log group KMS arn"
  value       = aws_kms_key.autotune-cloudwatch-kms.arn
}

output "cloudwatch_kms_id" {
  description = "RDS instance CloudWatch log group KMS id"
  value       = aws_kms_key.autotune-cloudwatch-kms.key_id
}

output "cloudwatch_kms_alias_arn" {
  description = "RDS instance CloudWatch log group KMS alias ARN"
  value       = aws_kms_alias.autotune-cloudwatch-kms-alias.arn
}

output "cloudwatch_kms_alias_id" {
  description = "RDS instance CloudWatch log group KMS alias ID"
  value       = aws_kms_alias.autotune-cloudwatch-kms-alias.id
}

output "cloudwatch_log_group_arn" {
  description = "RDS instance CloudWatch log group ARN(s)"
  value       = aws_cloudwatch_log_group.autotune-cloudwatch-logs[*].arn
}

output "cloudwatch_log_group_tags_all" {
  description = "RDS instance CloudWatch log group tags"
  value       = aws_cloudwatch_log_group.autotune-cloudwatch-logs[*].tags_all
}

#######################
# SSM Parameters
#######################
output "ssm_rds_username_arn" {
  description = "RDS username SSM Parameter ARN"
  value       = aws_ssm_parameter.autotune-rds-username.arn
}

output "ssm_rds_username_tags_all" {
  description = "RDS username SSM Parameter tags"
  value       = aws_ssm_parameter.autotune-rds-username.tags_all
}

output "ssm_rds_password_arn" {
  description = "RDS password SSM Parameter ARN"
  value       = aws_ssm_parameter.autotune-rds-password.arn
}

output "ssm_rds_password_tags_all" {
  description = "RDS password SSM Parameter tags"
  value       = aws_ssm_parameter.autotune-rds-password.tags_all
}

