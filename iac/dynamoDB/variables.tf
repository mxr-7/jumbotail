variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode for DynamoDB (e.g., PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PROVISIONED"
}

variable "hash_key" {
  description = "Hash key for the DynamoDB table"
  type        = string
}

variable "hash_key_type" {
  description = "Data type of the hash key (e.g., S for string, N for number)"
  type        = string
}

variable "range_key" {
  description = "Range key for the DynamoDB table"
  type        = string
  default     = null
}

variable "range_key_type" {
  description = "Data type of the range key (e.g., S for string, N for number)"
  type        = string
  default     = null
}

variable "read_capacity" {
  description = "Read capacity units for provisioned mode"
  type        = number
  default     = 1
}

variable "write_capacity" {
  description = "Write capacity units for provisioned mode"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags to apply to the DynamoDB table"
  type        = map(string)
  default     = {}
}

