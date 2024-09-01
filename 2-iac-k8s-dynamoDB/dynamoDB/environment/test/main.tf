provider "aws" {
  region = "us-west-2"
}

module "dynamodb_table" {
  source         = "../../modules/dynamodb"
  table_name     = "test-table"
  hash_key       = "id"
  read_capacity  = 5
  write_capacity = 5
  billing_mode   = "PROVISIONED"
  tags = {
    Environment = "test"
  }
}

output "dynamodb_table_name" {
  value = module.dynamodb_table.table_name
}

output "dynamodb_table_arn" {
  value = module.dynamodb_table.table_arn
}
