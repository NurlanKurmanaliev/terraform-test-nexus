# provider aws {
#     region = var.region
# }

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = local.common_tags
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[0]
  map_public_ip_on_launch = var.ip_on_launch
  availability_zone = var.azs[0]

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[1]
  map_public_ip_on_launch = var.ip_on_launch
  availability_zone = var.azs[1]

  tags = {
    Name = "subnet2"
  }
}

resource "aws_subnet" "main3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[2]
  map_public_ip_on_launch = var.ip_on_launch
  availability_zone = var.azs[2]

  tags = {
    Name = "subnet3"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = local.common_tags
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = local.common_tags
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.main2.id
  route_table_id = aws_route_table.example.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.main3.id
  route_table_id = aws_route_table.example.id
}

output subnet {
    value = aws_subnet.main.id
}