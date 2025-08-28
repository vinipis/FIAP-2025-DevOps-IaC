terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Substitua pela sua região
}

resource "aws_instance" "example" {
  ami           = "ami-0de716d6197524dd9" # Substitua pela AMI da sua região
  instance_type = "t2.micro"

  user_data = "templatefile /files/template_echo.sh.tpl"

  tags = {
    Name = "Local Exec Example"
  }

#  provisioner "local-exec" {
#    command = "echo 'Instância criada com sucesso!' > instance_info.txt"
#  }
}