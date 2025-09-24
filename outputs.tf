## defines what terraform should show you after apply 

output "vpc_id" {
    value = module.vpc.vpc_id
    description = "The ID of the VPC"
}

output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids
    description = "List of public subnet IDs"
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}