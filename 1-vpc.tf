# ============ config vpc ============

resource "aws_vpc" "eks-vpc" {
  cidr_block = "${var.vpc_cidr}"
  assign_generated_ipv6_cidr_block = false
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = merge(tomap({
            Name = "eks-vpc"}),
            local.common_tags,
         )
}
