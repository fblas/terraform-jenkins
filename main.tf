terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name= "ec2-bootcamp"
  user_data = "${file("apache_config.sh")}"

  tags = {
    Name = var.instance_name
  }
}
