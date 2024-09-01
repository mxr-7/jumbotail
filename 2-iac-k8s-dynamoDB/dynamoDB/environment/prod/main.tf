provider "aws" {
  region = "us-west-2"
}

module "dynamodb_table" {
  source         = "../../modules/dynamodb"
  table_name     = "production-table"
  hash_key       = "id"
  read_capacity  = 10
  write_capacity = 10
  billing_mode   = "PROVISIONED"
  tags = {
    Environment = "production"
  }
}

output "dynamodb_table_name" {
  value = module.dynamodb_table.table_name
}

output "dynamodb_table_arn" {
  value = module.dynamodb_table.table_arn
}
