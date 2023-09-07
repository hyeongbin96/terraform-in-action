output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value = aws_subnet.pub_sub.*.id
}

output "web_subnet_id" {
  description = "The ID of the web subnet"
  value = aws_subnet.web_sub.*.id
}

output "db_subnet_id" {
  description = "The ID of the db subnet"
  value = aws_subnet.db_sub.*.id
}

output "tags" {
  description = "The NAME of the TAGS"
  value = var.tags
}