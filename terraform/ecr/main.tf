# =====================================
# Terraform AWS ECR Repositories
# =====================================

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"   # Change to your region
}

# List of services
locals {
  services = ["auth-service", "account-service", "transaction-service", "frontend"]
}

# Loop to create ECR repositories
resource "aws_ecr_repository" "services" {
  for_each = toset(local.services)

  name                 = each.value
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = "4tier-banking-app"
    Service = each.value
  }
}

# Output repository URIs
output "ecr_repository_uris" {
  value = { for s, repo in aws_ecr_repository.services : s => repo.repository_url }
}
