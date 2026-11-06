locals {
  formatted_project_name = lower(replace(var.project_name," ",
  "-"))
  new_tag = merge(var.default_tags,var.environment_tags)
}


resource "aws_s3_bucket" "firsts3" {
  bucket = "hellokjlean"
  tags = local.new_tag
  }