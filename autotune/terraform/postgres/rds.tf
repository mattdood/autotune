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
  db_name = var.db_name
  identifier = var.db_identifier

  # Workload specification
  engine = "postgres"
  engine_version = var.db_version
  instance_class = var.db_instance_class
  parameter_group_name = var.db_parameter_group_name

  # Database maintenance
  backup_window = var.db_backup_window
  maintenance_window = var.db_maintenance_window

  # User access
  username = var.username
  password = var.password

  # Zone and networking
  availability_zone = var.db_availability_zone
  port = var.db_port
  vpc_security_group_ids = var.db_vpc_security_group_ids

  # Misc.
  allow_major_version_upgrade = false
  auto_minor_version_upgrade = false
  copy_tags_to_snapshot = true
  tags = var.tags
}

