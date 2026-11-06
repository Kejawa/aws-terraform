variable "environment" {
  type = string
  default = "dev"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type = number
}

variable "monitoring_enabled" {
  description = "Enable monitpring for EC2 instances"
  type = bool
  default = true
}

variable "associate_public_ip" {
  description = "Associate public IP address with EC2 instances"
  type = bool
  default = true
}

variable "cidr_block" {
  description = "CIDR block for VPC"
  type = list(string)
  default = ["10.0.0.0/8","192.168.0.0/16","172.16.0.0/12"]
}

variable "allowed_vm_types" {
  description = "List of allowed VM types"
  type = list(string)
  default = ["t2.micro","t2.small","t3.micro","t3.small"]
}

variable "allowed_region" {
  description = "List of allowed VM regions"
  type = set(string)
  default = ["us-east-1","us-west-2","eu-west-1","eu-west-2"]
  }

  variable "tags" {
    type = map(string)
    default = {
      Name        = "dev-instance"
      Environment = "dev"
      created_by = "terraform"
    }
  }

  variable "ingress_values" {
    type = tuple([ number, string, number ])
    default = [ 443, "tcp", 443 ]
  }

   variable "config" {
     type = object({
       region = string,
       monitoring = bool,
       instance_count = number
     })
     default = {
       region = "us-west-1",
       monitoring = true,
       instance_count = 1
     }
   }

   variable "bucket_names" {
    type = list(string)
    description = "List of S3 buckets names to create"
    default = [ "my-unique-buckett-day08-432171", "my-unique-buckett-day08-432172" ]
   }


   variable "bucket_name_set" {
    type = set(string)
    description = "Set of S3 buckets names to create"
    default = [ "my-unique-buckett-day08-432170", "my-unique-buckett-day08-432179" ]
   }