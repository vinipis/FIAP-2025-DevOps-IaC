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

# Criar um bucket S3 para armazenar o State
resource "aws_s3_bucket" "terraform_state" {
  bucket = "vinipis999-s3-test" # Substitua pelo nome desejado do bucket (deve ser globalmente único)

  # Impedir exclusão acidental do bucket
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Criar uma tabela DynamoDB para o bloqueio de State
resource "aws_dynamodb_table" "terraform_locks" {
  name           = "terraform-locks-vini" # Nome da tabela DynamoDB
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  # Impedir exclusão acidental da tabela
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "Terraform DynamoDB Table"
  }
}