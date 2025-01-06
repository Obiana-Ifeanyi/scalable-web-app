variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "description" {
  description = "The description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "A list of CIDR blocks for ingress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Default to allow all traffic
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}