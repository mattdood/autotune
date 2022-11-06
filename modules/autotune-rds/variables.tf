############################
# CloudWatch log group
############################
variable "create_cloudwatch_log_group" {
  type = bool
  description = "Controls whether or not to create CloudWatch log groups for each type of `var.enabled_cloudwatch_logs_exports`"
  default = true
}

variable "cloudwatch_log_group_retention_in_days" {
  type = number
  description = "Retention for logs in days"
  default = 14
}

############################
# User parameters in SSM
############################
variable "db_ssm_credentials" {
  type        = bool
  description = "Whether or not to upload credentials to SSM Parameter Store as secure strings"
  default     = true
}

variable "db_ssm_name" {
  type        = string
  description = "Name for SSM Parameter Store values. Do not include final key (e.g., username or password)"
  default     = null
}

variable "db_ssm_description" {
  type        = string
  description = "Description to provide for SSM Parameter Store stored credentials"
  default     = "Autotune RDS Instance Credential"
}

############################
# RDS database variables
############################
variable "allocated_storage" {
  type        = number
  description = "Database storage to be allocated (GiB). If max_allocated_storage is configured this is the initial storage."
  default     = 5
}

variable "allow_major_version_upgrade" {
  type        = bool
  description = "Allow for major version upgrades. Changes made to setting are asynchronously applied ASAP"
  default     = false
}

variable "apply_immediately" {
  type        = bool
  description = "Determines if database modifications should be applied immediately"
  default     = false
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "Determines if minor engine upgrades are applied automatically during the maintenance window"
  default     = true
}

variable "availability_zone" {
  type        = string
  description = "Availability zone of RDS instance"
}

variable "backup_retention_period" {
  type        = number
  description = "Number of days to retain backups, more than 0 and less than 35 days"
  default     = 7
}

variable "backup_window" {
  type        = string
  description = "Window of time allowable for DB backup to occur, cannot overlap with `maintenance_window`"
  default     = "22:00-22:30"
}

variable "ca_cert_identifier" {
  type        = string
  description = "Identifier of the CA certificate for the DB instance"
  default     = null
}

variable "character_set_name" {
  type        = string
  description = "Character set name to use for DB encoding in Oracle and MS SQL instances, cannot be changed"
  default     = null
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "Copy all instance tags to snapshots"
  default     = true
}

variable "custom_iam_instance_profile" {
  type        = string
  description = "Instance profile associated with underlying AWS EC2 instance of an RDS custom DB instance"
  default     = null
}

variable "db_name" {
  type        = string
  description = "Name of the database to create when the instance is created. If not provided then no database is created. Not applicable for Oracle or SQL Server"
  default     = null
}

variable "db_subnet_group_name" {
  type        = string
  description = "Name of a DB subnet group"
  default     = null
}

variable "delete_automated_backups" {
  type        = bool
  description = "Determines whether or not to remove automated backups immediately after the DB instance is deleted"
  default     = true
}

variable "deletion_protection" {
  type        = bool
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this is set to `true`"
  default     = false
}

variable "domain" {
  type        = string
  description = "The ID of the Directory Service Active Directory domain to create the instance in"
  default     = null
}

variable "domain_iam_role_name" {
  type        = string
  description = "The name of the IAM role to be used when making API calls to the Directory Service. Required if `domain` is provided"
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  type = list(string)
  description = "Enable or disable exports of RDS logs to CloudWatch"
  default = []
}

variable "engine" {
  type        = string
  description = "Type of database engine to use"
  default     = "postgres"
}

variable "engine_version" {
  type        = string
  description = "The engine version to use. If `auto_minor_version_upgrade` is enabled you can prefix the version such as `5.7` (for `5.7.10`). Engine version is returned to the `engine_version_actual` attribute"
  default     = null
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name of your final DB snapshot when the DB instance is deleted. Required if `skip_final_snapshot` is `false`"
  default     = null
}

variable "iam_database_authentication_enabled" {
  type        = bool
  description = "Specifies whether mappings of AWS IAM accounts to DB accounts is enabled"
  default     = false
}

variable "identifier" {
  type        = string
  description = "Identifier of RDS instance"
  default     = "autotune-db"
}

variable "identifier_prefix" {
  type        = string
  description = "Creates a unique identifier beginning with the prefix, conflicts with `identifier`"
  default     = null
}

variable "instance_class" {
  type        = string
  description = "Size and type of the DB instance class"
  default     = "db.t3.micro"
}

variable "iops" {
  type        = string
  description = "The amount of provisioned IOPS. Setting this implies a `storage_type` of `io1`"
  default     = null
}

variable "kms_key_id" {
  type        = string
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the desination KMS ARN"
  default     = null
}

variable "license_model" {
  type        = string
  description = "License model information for the DB instance"
  default     = null
}

variable "maintenance_window" {
  type        = string
  description = "Window of time allowable for maintenance to occur"
  default     = "Sat:00:00-Sun:03:00"
}

variable "max_allocated_storage" {
  type        = number
  description = "Max allowed database storage (GiB)"
  default     = null
}

variable "monitoring_interval" {
  type        = number
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. Must be one of: 0, 1, 5, 10, 15, 30"
  default     = 0
}

variable "monitoring_role_arn" {
  type        = string
  description = "ARN for the IAM role that permits RDS to send enhanced monitoring to CloudWatch"
  default     = null
}

variable "multi_az" {
  type        = bool
  description = "Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "nchar_character_set_name" {
  type        = string
  description = "Natitonal character set is used in the NCHAR, NVARCHAR2, and NCLOB data types for oracle"
  default     = null
}

variable "network_type" {
  type        = string
  description = "The network type of the DB instance, either IPV4 or DUAL"
  default     = null
}

variable "option_group_name" {
  type        = string
  description = "The name of the DB option group to associate"
  default     = null
}

variable "parameter_group_name" {
  type = string
  description = "The name of the DB parameter group to associate. See README for autotune DB parameter group information"
}

variable "password" {
  type        = string
  description = "RDS instance password for the master user. Will be stored in logs and state file. Default password is provided"
  default     = null
}

variable "performance_insights_enabled" {
  type        = bool
  description = "Specifies whether Performance Insights are enabled"
  default     = false
}

variable "performance_insights_kms_key_id" {
  type        = string
  description = "ARN for the KMS key to encrypt Performance Insights data. Keys cannot be changed"
  default     = null
}

variable "performance_insights_retention_period" {
  type        = number
  description = "Amount of time in days to retain Performance Insights data. Values are 7, 731 (2 years), or a multiple of 31"
  default     = null
}

variable "port" {
  type        = number
  description = "Port number of RDS instance"
  default     = 5432
}

variable "publicly_accessible" {
  type        = bool
  description = "Control if the database is publicly accessible"
  default     = false
}

variable "replicate_source_db" {
  type        = string
  description = "Identifier of an RDS instance to replicate or ARN of a database to replicate."
  default     = null
}

variable "restore_to_point_in_time" {
  type        = map(any)
  description = "Point in time restore resource block"
}

variable "s3_import" {
  type        = string
  description = "Restore from a Percona Xtrabackup in S3"
  default     = null
}

variable "security_group_names" {
  type        = list(string)
  description = "List of DB Security Groups to assicate. Only used for EC2-Classic platform"
  default     = null
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determine whether a final DB snapshot is created before an instance is deleted"
  default     = true
}

variable "snapshot_identifier" {
  type        = string
  description = "Specifies wehether or not to create this database from a snapshot. This correlates to the snapshot ID from an RDS console"
  default     = null
}

variable "storage_encrypted" {
  type        = bool
  description = "Specifies if the DB instance is encrypted. If this is cross-region read replica this field is ignored and should instead have a `kms_key_id` declared with an ARN"
  default     = false
}

variable "storage_type" {
  type        = string
  description = "One of `standard` (magnetic), `gp2` (general purpose SSD), or `io1` (provisioned IOPS SSD). Default is `io1` if `iops` is specified, `gp2` if not"
  default     = "gp2"
}

variable "tags" {
  type        = map(string)
  description = "Resource deployment tag by terraform. Note: Tags are shared between resources deployed by the module(s)"
  default     = {}
}

variable "timezone" {
  type        = string
  description = "Time zone of the DB isntance. Only supported by MS SQL Server, cannot be changed"
  default     = null
}

variable "username" {
  type        = string
  description = "RDS instance username value"
  default     = "autotune_user"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of all security group IDs associated with VPC"
}

variable "instance_class_memory" {
  type        = map(string)
  description = "Map of db instance class memory"
  default = {
    "db.t4g.micro"    = "1074000000"
    "db.t4g.small"    = "2148000000"
    "db.t4g.medium"   = "4296000000"
    "db.t4g.large"    = "8592000000"
    "db.t4g.xlarge"   = "17184000000"
    "db.t4g.2xlarge"  = "34368000000"
    "db.t3.micro"     = "2148000000"
    "db.t3.small"     = "2148000000"
    "db.t3.medium"    = "2148000000"
    "db.t3.large"     = "2148000000"
    "db.t3.xlarge"    = "4296000000"
    "db.t3.2xlarge"   = "8592000000"
    "db.t2.micro"     = "1074000000"
    "db.t2.small"     = "1074000000"
    "db.t2.medium"    = "2148000000"
    "db.t2.large"     = "2148000000"
    "db.t2.xlarge"    = "4296000000"
    "db.t2.2xlarge"   = "8592000000"
    "db.m6g.large"    = "2148000000"
    "db.m6g.xlarge"   = "4296000000"
    "db.m6g.2xlarge"  = "8592000000"
    "db.m6g.4xlarge"  = "17184000000"
    "db.m6g.8xlarge"  = "34368000000"
    "db.m6g.12xlarge" = "51552000000"
    "db.m6g.16xlarge" = "68736000000"
    "db.m5.large"     = "2148000000"
    "db.m5.xlarge"    = "4296000000"
    "db.m5.2xlarge"   = "8592000000"
    "db.m5.4xlarge"   = "17184000000"
    "db.m5.8xlarge"   = "34368000000"
    "db.m5.12xlarge"  = "51552000000"
    "db.m5.16xlarge"  = "68736000000"
    "db.m5.24xlarge"  = "103104000000"
    "db.m5d.large"    = "8592000000"
    "db.m5d.xlarge"   = "17184000000"
    "db.m5d.2xlarge"  = "34368000000"
    "db.m5d.4xlarge"  = "68736000000"
    "db.m5d.8xlarge"  = "137472000000"
    "db.m5d.12xlarge" = "206208000000"
    "db.m5d.16xlarge" = "274944000000"
    "db.m5d.24xlarge" = "412416000000"
    "db.m4.large"     = "2148000000"
    "db.m4.xlarge"    = "4296000000"
    "db.m4.2xlarge"   = "8592000000"
    "db.m4.4xlarge"   = "17184000000"
    "db.m4.10xlarge"  = "42960000000"
    "db.m4.16xlarge"  = "68736000000"
  }
}

