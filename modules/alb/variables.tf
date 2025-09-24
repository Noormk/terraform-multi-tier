variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  type = list(string)
  default = []
}

variable "alb_name" {
  type        = string
  default     = "app-alb"
  description = "Name of the Application Load Balancer"
}

variable "tg_name" {
  type        = string
  default     = "app-tg"
  description = "Name of the Target Group"
}
