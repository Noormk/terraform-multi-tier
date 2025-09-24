variable "vpc_id" {
  type        = string
  description = "VPC ID where the RDS will be deployed"
}

variable "db_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the RDS subnet group"
}

variable "db_sg_id" {
  type        = string
  description = "Security group ID for the RDS instance"
}

variable "db_name" {
  type        = string
  default     = "appdb"
  description = "Database name"
}

variable "db_username" {
  type        = string
  default     = "admin"
  description = "Master username for the database"
}

variable "db_password" {
  type        = string
  description = "Master password for the database"
  sensitive   = true
}

variable "db_instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "RDS instance type"
}

variable "db_engine" {
  type        = string
  default     = "mysql"
  description = "Database engine (mysql/postgres/etc.)"
}

variable "db_allocated_storage" {
  type        = number
  default     = 20
  description = "Storage size in GB"
}
