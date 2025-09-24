variable "project_name" {
    type = string
    default = "devops-project"
    description = "Name of the project used for tagging"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.1.0/16"
    description = "CIDR block for the VPC"
}

variable "public_subnets" {
    type = list(string)
    default = ["10.0.1.0/24"]
    description = "list of CIDR blocks for public subnets"
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "List of CIDR blocks for private subnets"
}

variable "azs" {
    type = list(string)
    default = ["eu-west-2a"]
    description = "list of AZs for subnets"
}