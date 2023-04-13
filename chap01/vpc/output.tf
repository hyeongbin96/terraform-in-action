output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  description = "The ID of the SUBNET"
  value = aws_subnet.pub_sub.*.id # pub_sub_2a id
}

output "tags" {
  description = "The NAME of the TAGS"
  value = var.tags
}