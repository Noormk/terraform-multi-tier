project_name     = "my_devops_app"
vpc_cidr         = "10.1.0.0/16"
public_subnets   = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnets  = ["10.1.11.0/24", "10.1.12.0/24"]
azs              = ["eu-west-2a", "eu-west-2b"]
ami_id           = "ami-xxxxxxxxxxxx"
db_password      = "CHANGE_ME"
