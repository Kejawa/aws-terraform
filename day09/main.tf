data "aws_ssm_parameter" "a12023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"
}


resource "aws_instance" "example" {
  ami = data.aws_ssm_parameter.a12023.value
  instance_type = var.allowed_vm_types[3]
  region = var.region

  tags = var.tags

  lifecycle {
    create_before_destroy = true
    prevent_destroy = false
  }
}

resource "aws_launch_template" "app_server" {
  name_prefix   = "app-server-"
  image_id      = data.aws_ssm_parameter.a12023.value
  instance_type = var.allowed_vm_types[3]

  tag_specifications {
    resource_type = "instance"
    tags = var.tags
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "app_servers" {
  name = "app-servers-asg"
  desired_capacity   = 2
  max_size           = 5
  min_size           = 1
  health_check_type  = "EC2"
  availability_zones = ["us-east-1a","us-east-1b","us-east-1c"]

  launch_template {
    id = aws_launch_template.app_server.id
    version = "$Latest"
  }

  tag {
    key = "Name"
    value = "App Server ASG"
    propagate_at_launch = true
  }
}