
# ============ config subnet private 1a ============

resource "aws_subnet" "private-subnet-1a" {

  vpc_id = "${aws_vpc.eks-vpc.id}"
  availability_zone = "us-east-1a"
  cidr_block = "${var.subnet_private-us-east-1a}"

  tags = merge(tomap({
            Name = "eks-private-subnet-1a"
            "kubernetes.io/role/internal-elb" = "1"
            "kubernetes.io/cluster/eks-urbanfood" = "owned"}),
            local.common_tags,
         )
}

# ============ config subnet private 1b ============

resource "aws_subnet" "private-subnet-1b" {

  vpc_id = "${aws_vpc.eks-vpc.id}"
  availability_zone = "us-east-1b"
  cidr_block = "${var.subnet_private-us-east-1b}"
          
  tags = merge(tomap({
            Name = "eks-private-subnet-1b"
            "kubernetes.io/role/internal-elb" = "1"
            "kubernetes.io/cluster/eks-urbanfood" = "owned"}),
            local.common_tags,
         )
}

# ============ config subnet public 1a ============

resource "aws_subnet" "public-subnet-1a" {

  vpc_id = "${aws_vpc.eks-vpc.id}"
  availability_zone = "us-east-1a"
  cidr_block = "${var.subnet_public-us-east-1a}"
  map_public_ip_on_launch = true
          
  tags = merge(tomap({
            Name = "eks-public-subnet-1a"
            "kubernetes.io/role/elb" = "1" #this instruct the kubernetes to create public load balancer in these subnets
            "kubernetes.io/cluster/eks-urbanfood" = "owned"}),
            local.common_tags,
         )
}

# ============ config subnet public 1b ============

resource "aws_subnet" "public-subnet-1b" {

  vpc_id = "${aws_vpc.eks-vpc.id}"
  availability_zone = "us-east-1b"
  cidr_block = "${var.subnet_public-us-east-1b}"
  map_public_ip_on_launch = true
          
  tags = merge(tomap({
            Name = "eks-public-subnet-1b"
            "kubernetes.io/role/elb" = "1" #this instruct the kubernetes to create public load balancer in these subnets
            "kubernetes.io/cluster/eks-urbanfood" = "owned"}),
            local.common_tags,
         )
}
