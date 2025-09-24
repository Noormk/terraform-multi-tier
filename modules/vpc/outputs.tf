# outputs ( vpc_id, public_subnets, private_subnets)

output "vpc_id" {
    value = aws_vpc.main.id
    description = "The ID of the VPC"
}

output "public_subnet_ids"{
    value = aws_subnet.public[*].id
    description = "List of public subnet IDs"
}

output "igw_id"{
    value = aws_internet_gateway.gw.id
    description = "The ID of the Internet Gateway"
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
