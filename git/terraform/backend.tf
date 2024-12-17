terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "terraform/eks-vpc-cluster/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}

