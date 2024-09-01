module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.21"
  subnets         = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  vpc_id          = aws_vpc.main.id

  node_groups = {
    node_group1 = {
      desired_capacity = 2
      max_capacity     = 4
      min_capacity     = 1

      instance_type = "t3.medium"
      key_name      = "my-key"
    }
  }

  enable_irsa = true
}
