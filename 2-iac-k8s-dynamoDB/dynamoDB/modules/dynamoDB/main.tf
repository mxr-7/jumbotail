resource "aws_dynamodb_table" "this" {
  name           = var.table_name
  hash_key        = var.hash_key
  read_capacity   = var.read_capacity
  write_capacity  = var.write_capacity
  billing_mode    = var.billing_mode

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = var.tags
}
