output "Dev_VPC_CIDR" {
  value = "Dev is in VPC ${module.vpc.cidr_block}"
  description = "The CIDR block of the VPC from dev.tf"
}

output "dev_provate_subnet" {
  value = "Dev's Private subnet is ${module.vpc.private_subnet_cidr}"
  description = "The private subnet from dev.tf"
}

output "Dev_Public_subnet" {
  value = "Dev's Public subnet is ${module.vpc.public_subnet_cidr}"
  description = "The public subnet from dev.tf"
}

output "public_ip" {
  value       = "Public IP of instance is: ${module.ec2.public_ip}"
  description = "The public IP of the EC2 instance"
}
