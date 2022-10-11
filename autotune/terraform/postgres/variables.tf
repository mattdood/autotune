#
variable "username" {
    type        = string
    description = "RDS instance username value"
}

variable "password" {
    type        = string
    description = "RDS instance password value"
}

#
variable "db_port" {
    type        = string
    description = "Port number of RDS instance"
}

variable "db_region" {
    type = string
    description = "Region of RDS instance"
}

variable "db_version" {
    type = string
    description = "Version of RDS instance"
}

variable "db_name" {
    type        = string
    description = "Name of RDS instance"
}

varaible "db_identifier" {
    type        = string
    description = "Identifier of RDS instance"
}

variable "db_tags" {
    type        = map(string)
    description = "Resource deployment tag by terraform"
}

#
variable "db_backup_window" {
    type        = string
    description = "Window of time allowable for DB backup to occur"
}

variable "db_maintenance_window" {
    type        = string
    description = "Window of time allowable for maintenance to occur"
}

variable "db_vpc_security_group_ids" {
    type        = list(string)
    description = "List of all security group IDs associated with VPC"
}

#
variable "db_instance_class" {
    type        = string
    description = "Size and type of the DB instance class"
    default     = ""
}

variable "db_instance_class_memory" {
    type        = map(string)
    description = "Map of db instance class memory"
    default     = {
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

locals {

}