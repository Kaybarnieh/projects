# Create VPC
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block              = "${var.vpc-cidr}"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "my vpc"
  }
}

# Create Public Subnet 1
# terraform aws create subnet
resource "aws_subnet" "web-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.web-subnet-1-cidr}"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public Subnet 1"
  }
}

# Create Public Subnet 2
# terraform aws create subnet
resource "aws_subnet" "web-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.web-subnet-2-cidr}"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public Subnet 2"
  }
}


# Create Private Subnet 1
# terraform aws create subnet
resource "aws_subnet" "application-subnet-1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.application-subnet-1-cidr}"
  availability_zone        = "eu-west-2a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private Subnet 1 | App Tier"
  }
}

# Create Private Subnet 2
# terraform aws create subnet
resource "aws_subnet" "application-subnet-2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.application-subnet-2-cidr}"
  availability_zone        = "eu-west-2b"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private Subnet 2 | App Tier"
  }
}

# Create Private Subnet 3
# terraform aws create subnet
resource "aws_subnet" "database-subnet-1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.database-subnet-1-cidr}"
  availability_zone        = "eu-west-2a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private Subnet 3 | Database Tier"
  }
}

# Create Private Subnet 4
# terraform aws create subnet
resource "aws_subnet" "database-subnet-2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.database-subnet-2-cidr}"
  availability_zone        = "eu-west-2b"
  map_public_ip_on_launch  = false


  tags      = {
    Name    = "Private Subnet 4 | Database Tier"
  }
}

# Create Internet Gateway and Attach it to VPC
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "my IGW"
  }
}

# Create Route Table and Add Public Route
# terraform aws create route table
resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags       = {
    Name     = "Public Route Table"
  }
}

# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "web-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.web-subnet-1.id
  route_table_id      = aws_route_table.public-route-table.id
}

# Associate Public Subnet 2 to "Public Route Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "web-subnet-2-route-table-association" {
  subnet_id           = aws_subnet.web-subnet-2.id
  route_table_id      = aws_route_table.public-route-table.id
}
 