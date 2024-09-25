
variable "instance_type" {
  description = "The instance type to use"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}

variable "public_key" {
  description = "The key pair name to use for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "The name tag for the EC2 instance"
  type        = string
}

#This will be used to merge tags
variable "tags" {
  type = map(string)
  default = {}
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}

variable "public_subnets" {
  type    = list(string)
  default = []
}

variable "vpc_id" {
  type    = string
}

variable "key_pair_exists" {
  description = "Flag to determine if the key pair already exists"
  type        = bool
  default     = false
}
