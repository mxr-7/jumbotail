module "dynamodb_table_prod" {
  source        = "../modules/dynamodb-table"
  table_name    = "prod-dynamodb-table"
  hash_key      = "id"
  hash_key_type = "S"
  read_capacity  = 20
  write_capacity = 20
  tags = {
    Environment = "Production"
  }
}

