# Terraform Multi-Tier AWS Infrastructure

## Overview
Brief explanation of what the project does and what resources it creates.

## Project Structure
Tree view of directories and modules.

## Prerequisites
### Software Requirements
- Terraform v1.5+
- AWS CLI configured (aws configure)

### AWS Requirements
- AWS account
- Valid AMI ID in your region

## Usage 
1. Clone the repo
     ```bash
     git clone 
     cd terraform-multi-tier
2. Initialize Terraform
    terraform init
3. Validate configuration
    terraform validate
4. Plan deployment
    terraform plan -var="db_password=SuperSecretPass123"
5. Apply changes
    terraform apply -var="db_password=SuperSecretPass123"

## Apply changes
### Example terraform.tfvars
```hcl
project_name   = "multi-tier"
vpc_cidr       = "10.0.1.0/16"
public_subnets = ["10.0.1.0/24"]
azs            = ["eu-west-2"]
ami_id         = "ami-123456"
db_password    = "SuperSecretPass123"

## Outputs 
- ALB DNS Name 
- RDS Endpoint
- ASG details

## Architecture


## Cleanup
Steps to destroy the infrastructure
```bash
terraform destroy -var="db_password=SuperSecretPass123"
Copy code

