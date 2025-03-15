
# ============ Security group ============

resource "aws_security_group" "sg-eks" {

  name = "SecGroup Cluster EKS"
  description = "Allow egress web access"

  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  vpc_id="${aws_vpc.eks-vpc.id}"

  tags = merge(tomap({
            Name = "sg-web-public-eks"}),
            local.common_tags,
         )
}
