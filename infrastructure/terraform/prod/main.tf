module "vpc" {
  source          = "../modules/vpc"
  cidr_block      = "10.0.0.0/16"
  name            = "prod-vpc"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "eks_deps" {
  source       = "../modules/eks_deps"
  cluster_name = "prod-cluster"
  vpc_id       = module.vpc.vpc_id
  tags = {
    Environment = "production"
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "prod-cluster"
  cluster_version = "1.30"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnet_ids

  # EKS Addons configuration
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  eks_managed_node_groups = {
    prod-nodes = {
      desired_capacity = 3 # This value is ignored after the initial creation of the node group
      max_capacity     = 5
      min_capacity     = 2
      instance_type    = "t3.medium"
      node_role_arn    = module.eks_deps.eks_node_role_arn
    }
  }

  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  enable_irsa               = true
}

module "karpenter" {
  source = "../modules/karpenter"

  cluster_name          = module.eks.cluster_name
  cluster_endpoint      = module.eks.cluster_endpoint
  iam_role_arn          = module.karpenter.iam_role_arn
  region                = var.region
  enable_v1_permissions = true

  node_iam_role_use_name_prefix   = false
  node_iam_role_name              = module.karpenter.iam_role_name
  create_pod_identity_association = true

  node_iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  tags = {
    Environment = "production"
  }
}


# Desired Size Ignored After Initial Creation: 
# The comment explains that the desired_size value is ignored after the initial creation of the node group. This means that once the node group is created, the desired_size attribute will not be managed by Terraform. Instead, the desired size will be managed by the EKS cluster autoscaler or other scaling mechanisms.