provider "aws" {
  region = "eu-north-1" 
}

resource "aws_security_group" "web_access" {
  name        = "allow_web_and_ssh"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
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
}

resource "aws_instance" "app_server" {
  ami           = "ami-0683ee28af6610487" 
  
  instance_type = "t3.micro"

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web_access.id]

  key_name = "my-devops-key"

  tags = {
    Name = "DevOpsProjectServer"
  }
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}