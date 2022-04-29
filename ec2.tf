#provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.12.0"
    }
  }
}

provider "aws" {
 region = "us-east-1"
}

#creating a aws_instance

resource "aws_instance" "terraform_instance" {
  ami           = "aws_ami_id"
  instance_type = "t2.micro"

  tags = {
    Name = "print any name for instance"
  }
}
