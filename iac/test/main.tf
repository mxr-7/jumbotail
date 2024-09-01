module "dynamodb_table_test" {
  source        = "../modules/dynamodb-table"
  table_name    = "test-dynamodb-table"
  hash_key      = "id"
  hash_key_type = "S"
  read_capacity  = 5
  write_capacity = 5
  tags = {
    Environment = "Test"
  }
}

