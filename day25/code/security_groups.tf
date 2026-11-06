# Security Group for EC2 Instances
resource "aws_security_group" "app_sg" {
  name        = "test-tf-sg"
  vpc_id      = data.aws_vpc.selected.id
  description = "launch-wizard-2 created 2026-11-05T07:17:46.785Z"

  ingress {
    description     = ""
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks    = ["0.0.0.0/0"]
      }

  ingress {
    description     = ""
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks    = ["0.0.0.0/0"]
      }

  ingress {
    description = ""
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = ""
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "managed_by": "Terraform"
  }

}
