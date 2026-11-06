terraform {
  
  cloud {
    
    organization = "kjtutorials"

    workspaces {
      name = "tf-cli"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create s3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "tech-bucket-1234"

  tags = {
    Name        = "My bucket 2.0"
    Environment = "Dev"
  }
}
