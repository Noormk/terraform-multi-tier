# Create RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.db_name}-subnet-group" #fix
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "${var.db_name}-subnet-group" #fix 
  }
}

# Create RDS instance
resource "aws_db_instance" "rds" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  instance_class       = var.db_instance_class
  db_name        = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids = [var.db_sg_id]
  skip_final_snapshot  = true
  publicly_accessible  = false
  multi_az             = false
  storage_type         = "gp2"

  tags = {
    Name = var.db_name
  }
}
