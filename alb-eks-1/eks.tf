module "eks" {
 source  = "terraform-aws-modules/eks/aws"
 version = "~> 20.0"

 cluster_name    = "eks-rdg"
 cluster_version = "1.30"


 cluster_endpoint_public_access = true

 create_kms_key              = false
 create_cloudwatch_log_group = false
 cluster_encryption_config   = {}

 cluster_addons = {
     coredns = {
     most_recent = true
     }
     kube-proxy = {
     most_recent = true
     }
     vpc-cni = {
     most_recent = true
     }
 }

 vpc_id                   = var.vpc_id
 subnet_ids               = var.private_subnets
 control_plane_subnet_ids = var.private_subnets

 # EKS Managed Node Group(s)
 eks_managed_node_group_defaults = {
     instance_types = ["m5.large", "m5.xlarge"]
 }

 eks_managed_node_groups = {
     blue = {}
     green = {
     min_size     = 1
     max_size     = 10
     desired_size = 1

     instance_types = ["t3.large"]
     #capacity_type  = "SPOT"
     }
 }

 tags = {
     env       = "rdg"
     terraform = "true"
 }
 }
