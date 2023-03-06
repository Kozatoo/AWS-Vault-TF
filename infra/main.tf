data "aws_ami" "web" {

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
  most_recent = true
}
provider "aws" {
  region = "eu-west-3"
}
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.web.id
  instance_type = "t2.micro"
  key_name      = "cleServeur"
  tags = {
    Name = var.ec2_name
  }
}

