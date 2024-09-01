output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = module.eks.cluster_id
}

output "node_group_role_arn" {
  value = module.eks.node_group_iam_role_arn
}
