# Parameter group variables
############################
variable "workload_type" {
  type = string
  description = "Database workload type"
}

# RDS database variables
############################
variable "allocated_storage" {
  type        = string
  description = "Database storage to be allocated (GiB). If max_allocated_storage is configured this is the initial storage."
}

variable "apply_immediately" {
  type        = bool
  description = "Determines if database modifications should be applied immediately"
  default     = false
}

variable "availability_zone" {
  type        = string
  description = "Availability zone of RDS instance"
}

variable "backup_retention_period" {
  type        = number
  description = "Number of days to retain backups, more than 0 and less than 35 days"
}

variable "backup_window" {
  type        = string
  description = "Window of time allowable for DB backup to occur"
}

variable "engine" {
  type        = string
  description = "Type of database engine to use"
}

variable "identifier" {
  type        = string
  description = "Identifier of RDS instance"
}

variable "instance_class" {
  type        = string
  description = "Size and type of the DB instance class"
  default     = "db.t3.micro"
}

variable "maintenance_window" {
  type        = string
  description = "Window of time allowable for maintenance to occur"
}

variable "max_allocated_storage" {
  type        = string
  description = "Max allowed database storage (GiB)"
}

variable "name" {
  type        = string
  description = "Name of a database to create when the instance is created"
  default     = "dev"
}

variable "parameter_group_type" {
  type        = string
  description = "Database parameter group"
}

variable "password" {
  type        = string
  description = "RDS instance password value"
}

variable "port" {
  type        = string
  description = "Port number of RDS instance"
  default     = "5432"
}

variable "publicly_accessible" {
  type        = bool
  description = "Control if the database is publicly accessible"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Resource deployment tag by terraform"
}

variable "username" {
  type        = string
  description = "RDS instance username value"
  default     = "awsuser"
}

variable "version" {
  type        = string
  description = "Version of RDS instance"
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

