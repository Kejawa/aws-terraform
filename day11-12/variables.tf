variable "project_name" {
  default = "Project ALPHA Resource"
}

variable "default_tags" {
  type = map(string)
  default = {
    company    = "TechCorp"
    managed_by = "terraform"
  }
}

variable "environment_tags" {
  type = map(string)
  default = {
    environment = "production"
    cost_center = "cc-123"
  }
}

variable "instance_type" {
  default = "t2.micro"

  validation {
    condition = length(var.instance_type) >2 && length(var.instance_type) <=20
    error_message = "instance type must be between 2 and 20 characters"
  }

  validation {
    condition = can(regex("^t[2-3]\\.", var.instance_type))
    error_message = "instance type must start with t2 or t3"
  }
}

variable "backup_name" {
  default = "daily_backup"

  validation {
    condition = endswith(var.backup_name, "_backup")
    error_message = "Backup must end with '_backup'"
  }
}