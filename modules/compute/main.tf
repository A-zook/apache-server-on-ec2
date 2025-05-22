resource "aws_instance" "web" {
  ami           = var.ami_id # <--  Put your preferred AMI ID in dev/main.tf
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name      = var.key_name # <--  Put your existing EC2 keypair name

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Hello from Terraform EC2 </h1>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "${var.env}-web-server"
  }
}
