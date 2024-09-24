variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

#VPC and subnets section
variable "cidr_block" {
  default = "10.1.0.0/16"
}

variable "private_subnet_cidr" {
    default = "10.1.1.0/24"
}

variable "public_subnet_cidr" {
    default = "10.1.2.0/24"
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "VPC_Name" {
  default = "StagingVPC"
}

variable "internet_gateway_name" {
  default = "Staging_InternetGateway"
}

variable "private_subnet_name" {
  default = "Staging_Private_Subenet"
}

variable "public_subnet_name" {
  default = "Staging Public Subnet"
}

#ec2 section

variable "instance_type" {
  default = "t2.micro"
}

variable "public_key" {
  default = "~/.ssh/id_rsa.pub" 
}

variable "instance_name" {
  default = "StagingInstance"
}

