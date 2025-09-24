resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.project_name
  }
}

#internet gateway = allows VPC to talk to the internet 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

#public subnets 
resource "aws_subnet" "public" {
    count  = length(var.public_subnets)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnets[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = true
}

#public route tables = creates a route table with a defsault route (0.0.0.0/0) sending traffic to the IGW
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

#associate public subnet with route table 
## wires everything togethter so the subnet inherits the route rules
resource "aws_route_table_association" "public_assoc" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# private subnets
resource "aws_subnet" "private" {
  count                   = length(var.private_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnets[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false
}

# private route table (no IGW route, usually routes via NAT GW)
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
}

# associate private subnets with private route table
resource "aws_route_table_association" "private_assoc" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
