variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "enable_v1_permissions" {
  description = "Determines whether to enable permissions suitable for v1+"
  type        = bool
  default     = true
}

variable "node_iam_role_use_name_prefix" {
  description = "Determines whether the IAM role name is used as a prefix"
  type        = bool
  default     = true
}

variable "node_iam_role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "create_pod_identity_association" {
  description = "Determines whether to create pod identity association"
  type        = bool
  default     = false
}

variable "node_iam_role_additional_policies" {
  description = "Additional policies to be added to the IAM role"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "iam_role_arn" {
  description = "The ARN of the IAM role for Karpenter"
  type        = string
}


variable "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  type        = string
}

