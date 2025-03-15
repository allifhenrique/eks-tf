
# ============ config nat-gateway ============

resource "aws_eip" "main" {
  domain = "vpc"

  tags = merge(tomap({
            Name = "nat"}),
            local.common_tags,
         )  
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public-subnet-1a.id

  tags = merge(tomap({
            Name = "public-nat-gateway"}),
            local.common_tags,
         ) 

  depends_on = [aws_internet_gateway.eks-igw]
}
