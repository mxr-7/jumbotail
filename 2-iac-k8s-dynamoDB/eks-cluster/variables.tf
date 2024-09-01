variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "my-eks-cluster"
}

variable "instance_type" {
  description = "The EC2 instance type for the worker nodes"
  default     = "t3.medium"
}
