terraform {
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
  bucket = "tech-bucket-12275"

  tags = {
    Name        = "My bucket 2.0"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "first_bucket2" {
  bucket = "tech-bucket-12272"

  tags = {
    Name        = "My bucket 3.0"
    Environment = "test"
  }
}
