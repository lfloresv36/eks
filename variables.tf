# variables.tf 
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-rdg-alb"
}

variable "cluster_version" {
  description = "EKS cluster version."
  type        = string
  default     = "1.30"
}

variable "ami_release_version" {
  description = "EKS AMI release version for node groups"
  type        = string
  default     = "1.30.0-20240625"
}

variable "vpc_cidr" {
  description = "Defines the CIDR block used on Amazon VPC created for Amazon EKS."
  type        = string
  default     = "10.111.0.0/16"
}

output "cluster_name" {
  value = var.cluster_name
}
                            
