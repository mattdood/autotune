# RDS database configuration
############################
# This is the core of the Postgres module and contains the instance
# itself. Workload specific configurations are stored under the
# associated workload file. E.g. olap.tf, oltp.tf, hybrid.tf.
#
# Note: This file is meant to be a baseline start for a database,
# it does not contain all settings that can be used (e.g., multi-az,
# allocated storage, network type, etc.).
#
# References:
#   * Database parameter references - A great site for the database parameter descriptions
#     and which engine version a parameter was created in
#     * https://postgresqlco.nf/doc/en/param/
#   * PGTune - A site for creating some default values for Postgres parameters.
#     * https://pgtune.leopard.in.ua/

resource "aws_db_instance" "postgres" {
  allocated_storage = var.allocated_storage
  allow_major_version_upgrade = false
  apply_immediately = var.apply_immediately
  auto_minor_version_upgrade = false
  availability_zone = var.availability_zone
  backup_window = var.backup_window
  copy_tags_to_snapshot = true
  db_name = var.db_name
  engine = "postgres"
  engine_version = var.version
  identifier = var.identifier
  instance_class = var.instance_class
  maintenance_window = var.maintenance_window
  max_allocated_storage = var.max_allocated_storage
  parameter_group_name = var.parameter_group_type
  password = var.password
  publicly_accessible = var.publicly_accessible
  port = var.port
  tags = var.tags
  username = var.username
  vpc_security_group_ids = var.vpc_security_group_ids
}

