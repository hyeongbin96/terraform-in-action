# vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.tags}-vpc"
  }
}

# public subnet
resource "aws_subnet" "pub_sub" {
  count = length(var.aws_az)
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.public_subnet[count.index]}"
  availability_zone = "${var.aws_az[count.index]}"

  tags = {
    Name = "${var.tags}-pub-sub-${var.aws_az_des[count.index]}"
  }
}

# private subnet
resource "aws_subnet" "priv_sub" {
  count = length(var.aws_az)
  vpc_id = aws_vpc.vpc.id
  cidr_block = "${var.private_subnet[count.index]}"
  availability_zone = "${var.aws_az[count.index]}"

  tags = {
    Name = "${var.tags}-priv-sub-${var.aws_az_des[count.index]}"
  }
}

# internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.tags}-igw"
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
    Name = "${var.tags}-pub-rt"
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
  count = length(var.aws_az)
  vpc = true

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.tags}-nat-${var.aws_az_des[count.index]}-eip"
  }
}

# nat gateway
resource "aws_nat_gateway" "nat_gw" {
  count = length(var.aws_az)
  allocation_id = "${aws_eip.nat_eip[count.index].id}"
  subnet_id = "${aws_subnet.pub_sub[count.index].id}"

  tags = {
    Name = "${var.tags}-nat-${var.aws_az_des[count.index]}"
  }
}

resource "aws_route_table" "priv_rt" {
  count = length(var.aws_az)
  vpc_id = aws_vpc.vpc.id
  depends_on = [aws_nat_gateway.nat_gw]
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw[count.index].id}"
  }

  tags = {
    Name = "${var.tags}-priv-rt-${var.aws_az_des[count.index]}"
  }
}

resource "aws_route_table_association" "priv_rt_association" {
  count = length(var.aws_az_des)
  subnet_id = "${aws_subnet.priv_sub[count.index].id}"
  route_table_id = "${aws_route_table.priv_rt[count.index].id}"
}