
terraform {
  required_providers { 
    aws = { 
      source = "hashicorp/aws" 
      version = "~> 5.0" 
    } 
  } 
}

provider "aws" {
region = var.REGION
}

#resource "aws_key_pair" "infra-key" {
#  key_name = "aws_infra_key.pem"
#}

resource "aws_instance" "first-instance" {
count                  = 1
ami                    = var.AMIS # Change you ami id accordingly
instance_type          = "t3.micro"
availability_zone      = var.Zone1
key_name               = "aws_infra_key"
vpc_security_group_ids = var.security # Change your security group id accordingly
tags = {
  Name = "Terraform"
  }

  provisioner "file" {
    source = "web.sh"
    destination = "/tmp/web.sh"
    }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo sh /tmp/web.sh"
      ]
     }

   connection {
     type = "ssh"
     user  = var.USER
     private_key = file("aws_infra_key.pem")
     host = self.public_ip
     }
}
