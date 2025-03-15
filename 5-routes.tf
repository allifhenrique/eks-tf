
# ============ config route table private ============

resource "aws_route_table" "eks-route-table-private" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat-gateway.id
    }

  tags = merge(tomap({
            Name = "eks-route-table-private"}),
            local.common_tags,
         )
}

# ============ config route table public ============

resource "aws_route_table" "eks-route-table-public" {
  vpc_id = "${aws_vpc.eks-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.eks-igw.id}"
  }
            
  tags = merge(tomap({
            Name = "eks-route-table-public"}),
            local.common_tags,
         )
}

# ============ Associando tabela de rota a subnet privada ============

resource "aws_route_table_association" "eks-private-route-1a" {
  subnet_id      = aws_subnet.private-subnet-1a.id
  route_table_id = aws_route_table.eks-route-table-private.id
}

resource "aws_route_table_association" "eks-private-route-1b" {
  subnet_id      = aws_subnet.private-subnet-1b.id
  route_table_id = aws_route_table.eks-route-table-private.id
}

# ============ Associando tabela de rota a subnet publica ============

resource "aws_route_table_association" "eks-public-route-1a" {
  subnet_id      = aws_subnet.public-subnet-1a.id
  route_table_id = aws_route_table.eks-route-table-public.id
}

resource "aws_route_table_association" "eks-public-route-1b" {
  subnet_id      = aws_subnet.public-subnet-1b.id
  route_table_id = aws_route_table.eks-route-table-public.id
}
