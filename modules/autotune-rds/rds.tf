# RDS module
#######################
# Contains all the requirements to create an RDS instance with sane defaults.
# This needs to have parameters pushed in, though defaults are provided for
# most settings. Workload and engine specification will pull in sub-moduels
# to generate parameter groups and create the RDS instance.

resource "aws_db_instance" "autotune-rds" {
  allocated_storage           = var.allocated_storage
  allow_major_version_upgrade = false
  apply_immediately           = var.apply_immediately
  auto_minor_version_upgrade  = false
  availability_zone           = var.availability_zone
  backup_window               = var.backup_window
  copy_tags_to_snapshot       = true
  db_name                     = var.db_name
  engine                      = var.engine
  engine_version              = var.version
  identifier                  = var.identifier
  instance_class              = var.instance_class
  maintenance_window          = var.maintenance_window
  max_allocated_storage       = var.max_allocated_storage
  parameter_group_name        = var.parameter_group_type
  password                    = var.password
  publicly_accessible         = var.publicly_accessible
  port                        = var.port
  tags                        = var.tags
  username                    = var.username
  vpc_security_group_ids      = var.vpc_security_group_ids
}

