variable "vpc_id" {
  type = string
}

variable "asg_sg_id" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list (string)
  description = "List of private subnet IDs where the ASG should launch EC2 instances"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instances"
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}

variable "target_group_arn" {
  type = string
}
