output "rds_endpoint" {
  value       = aws_db_instance.rds.endpoint
  description = "RDS endpoint for connecting to the database"
}

output "rds_id" {
  value       = aws_db_instance.rds.id
  description = "RDS instance ID"
}

output "rds_security_group_id" {
  value       = var.db_sg_id
  description = "RDS security group ID"
}
