resource "aws_vpc" "vpc" {
    cidr_block = var.aws_vpc

    tags = {
      Name = "${var.default_name}-vpc"
    }
}