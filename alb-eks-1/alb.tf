resource "helm_release" "alb-controller" {
 name       = "aws-load-balancer-controller"
 repository = "https://aws.github.io/eks-charts"
 chart      = "aws-load-balancer-controller"
 namespace  = "kube-system"
 depends_on = [
     kubernetes_service_account.service-account
 ]

 set {
     name  = "region"
     value = var.main-region
 }

 set {
     name  = "vpcId"
     value = var.vpc_id
 }

 set {
     name  = "image.repository"
     value = "602401143452.dkr.ecr.${var.main-region}.amazonaws.com/amazon/aws-load-balancer-controller"
 }

 set {
     name  = "serviceAccount.create"
     value = "false"
 }

 set {
     name  = "serviceAccount.name"
     value = "aws-load-balancer-controller"
 }

 set {
     name  = "clusterName"
     value = var.cluster_name
 }
 }
