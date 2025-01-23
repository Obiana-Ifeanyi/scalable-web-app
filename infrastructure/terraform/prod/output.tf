output "argocd_server_external_ip" {
  value = data.kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].hostname
  description = "The external IP or DNS name of the ArgoCD server LoadBalancer"
}
