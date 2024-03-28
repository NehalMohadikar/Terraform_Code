provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "demo-server-1" {
    ami = "ami-05295b6e6c790593e"
    instance_type = "t2.micro"
    key_name = "tf-key" 
    security_groups = ["demo_sg"]
}

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "SSH Access"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow_SSH"
  }
}
