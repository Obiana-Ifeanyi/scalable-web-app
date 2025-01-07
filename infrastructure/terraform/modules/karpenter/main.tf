# resource "helm_release" "karpenter" {
#   name       = "karpenter"
#   repository = "https://charts.karpenter.sh"
#   chart      = "karpenter"
#   version    = "0.16.1" # Specify the version you want to use

#   namespace = "karpenter"
#   create_namespace = true

#   set {
#     name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#     value = var.iam_role_arn
#   }

#   set {
#     name  = "controller.clusterName"
#     value = var.cluster_name
#   }

#   set {
#     name  = "controller.clusterEndpoint"
#     value = var.cluster_endpoint
#   }

#   set {
#     name  = "controller.awsRegion"
#     value = var.region
#   }
# }


data "aws_ecrpublic_authorization_token" "token" {
  provider = aws
}

resource "helm_release" "karpenter" {
  namespace           = "kube-system"
  name                = "karpenter"
  repository          = "oci://public.ecr.aws/karpenter"
  repository_username = data.aws_ecrpublic_authorization_token.token.user_name
  repository_password = data.aws_ecrpublic_authorization_token.token.password
  chart               = "karpenter"
  version             = "1.1.1"
  wait                = false

  values = [
    <<-EOT
    nodeSelector:
      karpenter.sh/controller: 'true'
    dnsPolicy: Default
    settings:
      clusterName: ${var.cluster_name}
      clusterEndpoint: ${var.cluster_endpoint}
    webhook:
      enabled: false
    EOT
  ]
}