#Star of "resource" block
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
#End of "resource" block
