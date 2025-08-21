resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = var.name
  }
}