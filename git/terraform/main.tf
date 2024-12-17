rovider "aws" {
  region = "us-east-1"
}



module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-rdg"
  cluster_version = "1.26"
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }
}


resource "helm_release" "aws_load_balancer_controller" {
  name       = "aws-load-balancer-controller"
  namespace  = "kube-system"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.5.3"

  set {
    name  = "clusterName"
    value = module.eks.cluster_id
  }

  set {
    name  = "region"
    value = "us-east-1"
  }

  set {
    name  = "vpcId"
    value = module.eks.vpc_id
  }
}

