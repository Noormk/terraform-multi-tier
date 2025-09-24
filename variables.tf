## define project-wide variables (region, project name, instance type...)
## keeps code clean+ reusable

variable "aws_region" {
    default = "eu-west-2"
}

variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "ami_id" {
  type = string
  description = "AMI ID for EC2 instances"
}

variable "db_password" {
  type        = string
  description = "RDS master password"
  sensitive   = true
}


 
