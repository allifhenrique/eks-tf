# ============ config internet gateway ============

resource "aws_internet_gateway" "eks-igw" {
  vpc_id = "${aws_vpc.eks-vpc.id}"
            
  tags = merge(tomap({
            Name = "eks-igw"}),
            local.common_tags,
         )
}
