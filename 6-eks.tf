# ============ IAM role for eks ============

resource "aws_iam_role" "eks_cluster_role" {
  name = "iam-role-eks-urbanfood"

  tags = merge(tomap({
            Name = "iam-role-eks-urbanfood"}),
            local.common_tags,
         )  

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

# ============ eks policy attachment ============

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

# ============ config cluster eks ============

resource "aws_eks_cluster" "cluster-urbanfood" {
  name     = "${var.cluster_name}"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-subnet-1a.id,
      aws_subnet.private-subnet-1b.id,
      aws_subnet.public-subnet-1a.id,
      aws_subnet.public-subnet-1b.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy,
  ]
}