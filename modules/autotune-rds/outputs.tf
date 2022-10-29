# RDS database outputs
############################

output "address" {
  description = "RDS hostname"
  value = aws_instance.postgres.address
}

output "arn" {
  description = "ARN of the RDS instance"
  value = aws_instance.postgres.arn
}

output "availability_zone" {
  description = "RDS availability zone"
  value = aws_instance.postgres.availability_zone
}

output "endpoint" {
  description = "Endpoint of the Postgres database instance"
  value = aws_instance.postgres.endpoint
}

output "engine_version_actual" {
  description = "RDS actual engine version"
  value = aws_instance.postgres.engine_version_actual
}

output "hosted_zone_id" {
  description = "RDS hosted zone ID"
  value = aws_instance.postgres.hosted_zone_id
}

output "instance_class" {
  description = "RDS instance class"
  value = aws_instance.postgres.instance_class
}

output "multi_az" {
  description = "If the RDS is multi AZ enabled"
  value = aws_instance.postgres.multi_az
}

output "name" {
  description = "Name of the created database"
  value = aws_instance.postgres.name
}

output "port" {
  description = "Port of the created database"
  value = aws_instance.postgres.port
}

output "resource_id" {
  description = "Resource ID of the RDS instance"
  value = aws_instance.postgres.port
}

output "tags" {
  description = "Resource tags map of the RDS instance"
  value = aws_instance.postgres.tags_all
}

output "username" {
  description = "Master database username"
  value = aws_instance.postgres.username
}

