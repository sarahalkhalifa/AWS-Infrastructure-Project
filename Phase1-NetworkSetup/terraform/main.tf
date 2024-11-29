# ==========================
# AWS Provider Configuration
# ==========================
provider "aws" {
  region = "us-west-2"
}

# ==========================
# VPC Configuration
# ==========================
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Main-VPC"
  }
}

# ==========================
# Subnet Configuration
# ==========================
# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"
  tags = {
    Name = "Public-Subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/23"
  availability_zone = "us-west-2a"
  tags = {
    Name = "Private-Subnet"
  }
}

# ==========================
# Internet Gateway
# ==========================
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Main-IGW"
  }
}

# ==========================
# NAT Gateway
# ==========================
# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  vpc = true
  tags = {
    Name = "NAT-EIP"
  }
}

# NAT Gateway Configuration
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "Main-NAT-Gateway"
  }
}

# ==========================
# Route Tables
# ==========================
# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Public-RT"
  }
}

# Public Route
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Private-RT"
  }
}

# Private Route
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

