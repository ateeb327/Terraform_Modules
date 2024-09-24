resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
 tags       = merge(var.tags, {
    Name = var.VPC_Name
  })
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags       = merge(var.tags, {
    Name = var.internet_gateway_name
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
   tags       = merge(var.tags, {
    Name = var.private_subnet_name
  })
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
   tags       = merge(var.tags, {
    Name = var.public_subnet_name
  })
}
