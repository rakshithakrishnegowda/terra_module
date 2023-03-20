resource "aws_instance" "my_ec2_instance" {
    ami = var.ami_id
    instance_type = var.ec2_type
    key_name = var.ec2_pem
    vpc_security_group_ids = [var.ec2_sg_id]
    user_data = <<-EOF
      #!/bin/bash
      sudo apt-get update
      sudo apt install -y openjdk-8-jre-headless
      wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
      sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
      sudo apt update
      sudo apt install -y jenkins 
      sudo systemctl start jenkins
      EOF
  tags = {
    Name = "Terraform"
  }
}
