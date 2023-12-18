# Start of block
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
# End of block