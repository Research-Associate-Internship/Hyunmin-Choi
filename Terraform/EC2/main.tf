resource "aws_instance" "ec2" {
  ami = "ami-007855ac798b5175e"

  instance_type = "t2.micro"
  key_name = "ec2"
  vpc_security_group_ids = [aws_security_group.MYSG.id]
  subnet_id = "${element(module.vpc.public_subnets, 0)}"



  # user_data = <<-EOF
	# 	#!/bin/bash
  #   sudo yum update -y
  #   sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo --no-check-certificate
  #   sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  #   sudo yum install jenkins -y
  #   sudo systemctl start jenkins
  #   sudo systemctl enable jenkins
	# EOF

  tags = {
    Name = var.instance_name
  }
}









 


