module "vpc" {
  source = "../modules/vpc"
  cidr_block = "10.0.0.0/16"
  name = "prod-vpc"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "eks_deps" {
  source       = "../modules/eks_deps"
  cluster_name = "prod-cluster"
  vpc_id       = module.vpc.vpc_id
  tags = {
    Environment = "production"
    Project     = "dagster-eks-poc"
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "prod-cluster"
  cluster_version = "1.30"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnet_ids

  eks_managed_node_groups = {
    prod-nodes = {
      desired_capacity = 3
      max_capacity     = 5
      min_capacity     = 2
      instance_type    = "t3.medium"
      node_role_arn    = module.eks_deps.eks_node_role_arn
    }
  }

  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  enable_irsa = true
}

# module "security_groups" {
#   source = "../modules/security-groups"
#   name = "prod-eks-sg"
#   description = "Security group for EKS in production"
#   vpc_id = module.vpc.vpc_id
#   ingress_cidr_blocks = ["0.0.0.0/0"]
#   tags = {
#     Environment = "production"
#     Project     = "dagster-eks-poc"
#   }
# }