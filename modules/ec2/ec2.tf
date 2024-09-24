data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_key_pair" "existing" {
  key_name = "TerraformKeyPair"
  # This allows the data source to return null instead of erroring
  lifecycle {
    postcondition {
      condition     = self.key_pair_id != null
      error_message = "Key pair not found, but this is okay."
    }
  }
}

resource "aws_key_pair" "aws_key_pair" {
  count      = data.aws_key_pair.existing.key_pair_id == null ? 1 : 0
  key_name   = "TerraformKeyPair"
  public_key = file(var.public_key)
}
# resource "aws_key_pair" "aws_key_pair" {
#   key_name   = "TerraformKeyPair"
#   public_key = file(var.public_key)
#   lifecycle {
#     ignore_changes = [public_key]
#   }
# }

resource "aws_security_group" "TerraformSecurityGroup" {
  name = "TerraformSecurityGroup"
  vpc_id = var.vpc_id
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  #key_name = aws_key_pair.aws_key_pair.key_name
  key_name = try(data.aws_key_pair.existing.key_name, aws_key_pair.aws_key_pair[0].key_name)
  
  security_groups = [aws_security_group.TerraformSecurityGroup.id]
  associate_public_ip_address = contains(var.public_subnets, var.subnet_id) ? true : false
  user_data     = <<-EOF
                    #!/bin/bash
                    sudo apt update -y
                    sudo apt install -y nginx
                    sudo systemctl start nginx
                    echo "<h1>Hello from ${var.instance_name}</h1>" > /var/www/html/index.html
                    EOF
  
   tags       = merge(var.tags, {
    Name = var.instance_name 
  })
}
