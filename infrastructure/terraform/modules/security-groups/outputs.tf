output "eks_cluster_role_arn" {
  description = "The ARN of the EKS cluster IAM role"
  value       = aws_iam_role.eks_cluster.arn
}

output "eks_node_role_arn" {
  description = "The ARN of the EKS node IAM role"
  value       = aws_iam_role.eks_node.arn
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.eks.id
}