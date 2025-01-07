output "iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the IAM role"
  value       = aws_iam_role.karpenter_role.arn
}

output "instance_profile_arn" {
  description = "The ARN assigned by AWS to the instance profile"
  value       = aws_iam_instance_profile.karpenter_instance_profile.arn
}

output "iam_role_name" {
  description = "The name of the controller IAM role"
  value       = aws_iam_role.karpenter_role.name
}