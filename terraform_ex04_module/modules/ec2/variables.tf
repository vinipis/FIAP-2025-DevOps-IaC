variable "ami" {
  type = string
  description = "AMI da instância EC2"
}

variable "instance_type" {
  type = string
  description = "Tipo da instância EC2"
}

variable "security_groups" {
  type = list(string)
  description = "Lista de Security Groups"
}

variable "name" {
  type = string
  description = "Nome da instância EC2"
}

variable "vpc_id" {
  description = "id da VPC onde o SG vai ser criado..."
  type = string
  default = "vpc-090bb017b83684ae6"
}