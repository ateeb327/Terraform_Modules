output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "private_subnet_cidr" {
  value = aws_subnet.private.cidr_block
}

output "public_subnet_cidr" {
  value = aws_subnet.public.cidr_block
}
