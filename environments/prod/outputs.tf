output "Prod_VPC_CIDR" {
  value = "Prod is in VPC ${module.vpc.cidr_block}"
  description = "The CIDR block of the VPC from prod.tf"
}

output "Prod_Private_subnet" {
  value = "Prdo's Private subnet is ${module.vpc.private_subnet_cidr}"
  description = "The private subnet from prod.tf"
}

output "Prod_Public_subnet" {
  value = "Prod's Public subnet is: ${module.vpc.public_subnet_cidr}"
  description = "The public subnet from prod.tf"
}

output "public_ip" {
  value       = "Public IP of instance is: ${module.ec2.public_ip}"
  description = "The public IP of the EC2 instance"
}