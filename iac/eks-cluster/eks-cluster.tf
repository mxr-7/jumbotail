provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.24.0"  # Ensure you're using the correct module version

  cluster_name    = "my-cluster"
  cluster_version = "1.21"
  
  vpc_id  = "vpc-xxxxxxxx"
  subnet_ids = ["subnet-xxxxxx", "subnet-yyyyyy"]  # Replace with your actual subnet IDs

  node_group_defaults = {
    desired_capacity = 3
    max_capacity     = 5
    min_capacity     = 1
  }

  managed_node_groups = [
    {
      name                 = "eks_nodes"
      instance_type        = "t3.medium"
      desired_capacity     = 3
      max_capacity         = 5
      min_capacity         = 1
      key_name             = "my-key"
    }
  ]

  tags = {
    Environment = "Production"
  }
}

