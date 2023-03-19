output "ec2_public_ip_adress" {
    value = aws_instance.my_ec2_instance.public_ip
}
