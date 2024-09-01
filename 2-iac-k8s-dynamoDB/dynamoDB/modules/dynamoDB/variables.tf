// terraform/modules/dynamodb/variables.tf
variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "The hash key (partition key) for the DynamoDB table"
  type        = string
}

variable "read_capacity" {
  description = "The read capacity units for the DynamoDB table"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "The write capacity units for the DynamoDB table"
  type        = number
  default     = 5
}

variable "billing_mode" {
  description = "The billing mode for the DynamoDB table"
  type        = string
  default     = "PROVISIONED"
}

variable "tags" {
  description = "Tags for the DynamoDB table"
  type        = map(string)
  default     = {}
}
