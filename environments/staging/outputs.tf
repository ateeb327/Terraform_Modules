output "staging_VPC_CIDR" {
  value = "Staging is in VPC ${module.vpc.cidr_block}"
  description = "The CIDR block of the VPC from staging.tf"
}

output "staging_Private_subnet" {
  value = "Staging's Private subnet is ${module.vpc.private_subnet_cidr}"
  description = "The private subnet from staging.tf"
}

output "staging_Public_subnet" {
  value = "Staging's Public subnet is: ${module.vpc.public_subnet_cidr}"
  description = "The public subnet from staging.tf"
}

output "public_ip" {
  value       = "Public IP of instance is: ${module.ec2.public_ip}"
  description = "The public IP of the EC2 instance"
}
