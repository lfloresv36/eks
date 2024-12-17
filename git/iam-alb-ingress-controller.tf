# iam-alb-ingress-controller.tf

resource "aws_iam_role" "alb_ingress_controller_role" {
  name = "alb-ingress-controller-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "alb_ingress_controller_policy_attachment" {
  role       = aws_iam_role.alb_ingress_controller_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSLoadBalancingPolicy"
}
