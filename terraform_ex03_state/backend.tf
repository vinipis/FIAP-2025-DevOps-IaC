terraform {
  backend "s3" {
    bucket         = "vinipis999-s3-test"  # Usar o nome do bucket criado pelo Terraform
    key            = "infra/terraform.tfstate" # Nome do arquivo de estado
    region         = "us-east-1"      # Substitua pela sua região
    use_lockfile = true
    dynamodb_table = "terraform-locks-vini" # Usar o nome da tabela DynamoDB criada pelo Terraform
    encrypt        = true             # Habilitar a criptografia do State no S3
  }
}