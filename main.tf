## the orchestrator file 
## where you call your modules 

module "vpc" {
    source = "./modules/vpc"
    project_name = var.project_name
    vpc_cidr = var.vpc_cidr
    public_subnets = var.public_subnets
    azs = var.azs
}

module "security" {
    source = "./modules/security"
    vpc_id = module.vpc.vpc_id
}

module "alb" {
    source = "./modules/alb"
    vpc_id = module.vpc.vpc_id
    public_subnet_ids = module.vpc.public_subnet_ids
}

module "ec2_asg" {
  source = "./modules/ec2_asg"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  asg_sg_id          = [module.security.app_sg_id]
  target_group_arn   = module.alb.target_group_arn
  ami_id             = var.ami_id
}



module "rds" {
    source = "./modules/rds"
    vpc_id = module.vpc.vpc_id
    db_subnet_ids = module.vpc.private_subnet_ids
    db_sg_id = module.security.db_sg_id
    db_name = "appdb"
    db_username = "admin"
    db_password = var.db_password
    db_instance_class = "db.t3.micro"
    db_engine = "mysql"
    db_allocated_storage = 20
}