# RDS Module
#######################
# Contains all the requirements to create an RDS instance with sane defaults.
# This needs to have parameters pushed in, though defaults are provided for
# most settings. Workload and engine specification will pull in sub-moduels
# to generate parameter groups and create the RDS instance.

#######################
# Password
#######################
# Create random password if not provided
resource "random_password" "random_db_password" {
  length      = 20
  special     = true
  min_lower   = 1
  min_numeric = 1
  min_special = 1
  min_upper   = 1
}

locals {
  db_password = coalesce(var.password, random_password.random_db_password.result)
}

#######################
# SSM Parameters
#######################
resource "aws_ssm_parameter" "autotune-rds-username" {
  count = var.db_ssm_credentials ? 1 : 0

  name        = "${var.db_ssm_name}/username"
  description = var.db_ssm_description
  type        = "SecureString"
  value       = aws_db_instance.autotune-rds.username
}

resource "aws_ssm_parameter" "autotune-rds-password" {
  count = var.db_ssm_credentials ? 1 : 0

  name        = "${var.db_ssm_name}/password"
  description = var.db_ssm_description
  type        = "SecureString"
  value       = local.db_password
}

#######################
# RDS resource
#######################
resource "aws_db_instance" "autotune-rds" {
  allocated_storage                     = var.allocated_storage
  allow_major_version_upgrade           = var.allow_major_version_upgrade
  apply_immediately                     = var.apply_immediately
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  availability_zone                     = var.availability_zone
  backup_retention_period               = var.backup_retention_period
  backup_window                         = var.backup_window
  ca_cert_identifier                    = var.ca_cert_identifier
  character_set_name                    = var.character_set_name
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot
  custom_iam_instance_profile           = var.custom_iam_instance_profile
  db_name                               = var.db_name
  db_subnet_group_name                  = var.db_subnet_group_name
  delete_automated_backups              = var.db_subnet_group_name
  deletion_period                       = var.deletion_period
  domain                                = var.domain
  domain_iam_role_name                  = var.domain_iam_role_name
  enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
  engine                                = var.engine
  engine_version                        = var.engine_version
  final_snapshot_identifier             = var.final_snapshot_identifier
  iam_database_authentication_enabled   = var.iam_database_authentication_enabled
  identifier                            = var.identifier
  identifier_prefix                     = var.identifier_prefix
  instance_class                        = var.instance_class
  iops                                  = var.iops
  kms_key_id                            = var.kms_key_id
  license_model                         = var.license_model
  maintenance_window                    = var.maintenance_window
  max_allocated_storage                 = var.max_allocated_storage
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = var.monitoring_role_arn
  multi_az                              = var.multi_az
  nchar_character_set_name              = var.nchar_character_set_name
  option_group_name                     = var.option_group_name
  parameter_group_name                  = module.db_parameter_group.name
  password                              = local.db_password
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period
  port                                  = var.port
  publicly_accessible                   = var.publicly_accessible
  replicate_source_db                   = var.replicate_source_db
  restore_to_point_in_time              = var.restore_to_point_in_time
  s3_import                             = var.s3_import
  security_group_names                  = var.security_group_names
  skip_final_snapshot                   = var.skip_final_snapshot
  snapshot_identifier                   = var.snapshot_identifier
  storage_encrypted                     = var.storage_encrypted
  storage_type                          = var.storage_type
  tags                                  = var.tags
  username                              = var.username
  vpc_security_group_ids                = var.vpc_security_group_ids
  customer_owned_ip_enabled             = var.customer_owned_ip_enabled
}

# RDS Parameter group
#######################
# Finds the parameter group module to load and optionally includes a ref
# determination if there is a specific version requested.
locals {
  workload_version_ref = var.workload_version ? "?ref=${var.workload_version}" : ""
}

module "db_parameter_group" {
  source         = "github.com/mattdood/autotune/modules/autotune-${var.engine}${local.workload_version_ref}"
  engine_version = var.engine_version
  workload_type  = var.workload_type
}

