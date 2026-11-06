data "aws_vpc" "vpc_name" {
  filter {
    name = "tag:Name"
    values = ["default"]
  }
 
 }

data aws_subnet "shared" {
  filter {
    name = "tag:Name"
    values = ["subneta"]
  }
  vpc_id = data.aws_vpc.vpc_name.id
}

data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}


resource "aws_instance" "example" {
  ami           = data.aws_ssm_parameter.al2023.value
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.shared.id
  tags = var.tags

}
