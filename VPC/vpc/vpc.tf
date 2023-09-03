# vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.tags}-VPC"
  }
}

# public subnet
resource "aws_subnet" "pub_sub" {
  count = length(var.aws_az)
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.public_subnet[count.index]}"
  availability_zone = "${var.aws_az[count.index]}"

  tags = {
    Name = "${var.tags}-SUB-PUBLIC-${var.aws_az_des[count.index]}"
  }
}

# web subnet
resource "aws_subnet" "web_sub" {
  count = length(var.aws_az)
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.web_subnet[count.index]}"
  availability_zone = "${var.aws_az[count.index]}"

  tags = {
    Name = "${var.tags}-SUB-WEB-${var.aws_az_des[count.index]}"
  }
}

# db subnet
resource "aws_subnet" "db_sub" {
  count = length(var.aws_az)
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.db_subnet[count.index]}"
  availability_zone = "${var.aws_az[count.index]}"

  tags = {
    Name = "${var.tags}-SUB-DB-${var.aws_az_des[count.index]}"
  }
}

# internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.tags}-IGW"
  }
}

# public routing table
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_internet_gateway.igw]

  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.tags}-PUB-RT"
  }
}

# public rt association
resource "aws_route_table_association" "pub_rt_association" {
  count = length(aws_route_table.pub_rt)
  subnet_id = "${element(aws_subnet.pub_sub.*.id, count.index)}"
  route_table_id = "${aws_route_table.pub_rt.id}"
}

# NAT EIP
resource "aws_eip" "nat_eip" {
  #count = length(var.aws_az)
  domain = "vpc"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.tags}-EIP"
  }
}

# nat gateway
resource "aws_nat_gateway" "nat_gw" {
  #count = length(var.aws_az)
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id = "${aws_subnet.pub_sub[0].id}"

  tags = {
    Name = "${var.tags}-NAT-${var.aws_az_des[0]}"
  }
}

# web routing table
resource "aws_route_table" "web_rt" {
  #count = length(var.aws_az)
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_nat_gateway.nat_gw]
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

  tags = {
    Name = "${var.tags}-WEB-RT"
  }
}

resource "aws_route_table_association" "web_rt_association" {
  count = length(var.aws_az_des)
  subnet_id = "${aws_subnet.web_sub[count.index].id}"
  route_table_id = aws_route_table.web_rt.id
}

# db routing table
resource "aws_route_table" "db_rt" {
  #count = length(var.aws_az)
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_nat_gateway.nat_gw]
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

  tags = {
    Name = "${var.tags}-DB-RT"
  }
}

resource "aws_route_table_association" "db_rt_association" {
  count = length(var.aws_az_des)
  subnet_id = "${aws_subnet.db_sub[count.index].id}"
  route_table_id = aws_route_table.db_rt.id
}