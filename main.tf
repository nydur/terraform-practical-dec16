# Start of provider.tf block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0" // best practice to specify version
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
# End of provider.tf block

resource "aws_instance" "web1" {
  ami             = "ami-05d1dd0175a5c3b99"
  instance_type   = "t3.micro"
  subnet_id       = "subnet-0e89cf792598a2ba4"
  key_name        = "rudyn-ssh" // create ssh key pair
  security_groups = [aws_security_group.allow_ssh.id] // attach security group

  tags = {
    Name = "rudyn-instance-ab" // instance name
  }
}

#resource "aws_instance" "web2" { // additional instance
#  ami           = "ami-05d1dd0175a5c3b99"
#  instance_type = "t3.micro"
#  subnet_id = "subnet-0e89cf792598a2ba4"

#  tags = {
#    Name = "rudyn-instance2"
#  }
#}

# Start of securitygroup.tf block
resource "aws_security_group" "allow_ssh" { // create security group
  name        = "rudyn-allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-0582d885a3bc6c51b"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  #  egress { // outgoing
  #    from_port        = 0
  #    to_port          = 0
  #    protocol         = "-1"
  #    cidr_blocks      = ["0.0.0.0/0"]
  #    ipv6_cidr_blocks = ["::/0"]
  #  }

  tags = {
    Name = "rudyn-allow-ssh"
  }
}
# End of securitygroup.tf block

# Start of variables.tf block
variable "name_prefix" {
  type = string
  default = "rudyn"
}

variable "environment" {
  type = string
  default = "development"
}
# End of variables.tf block

# Start of outputs.tf block
output "web1_public_ip" {
    value = aws_instance.web1.public_ip
}
# End of outputs.tf block
