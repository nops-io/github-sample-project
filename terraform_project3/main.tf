terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "project3_ec2_instance_1" {
  ami           = "ami-2757f631"
  instance_type = "t2.small"
  tags = {
    Name = "project3_instance_small_1"
  }
}
resource "aws_instance" "ec2_instance_2" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  tags = {
    Name = "project3_instance_micro"
  }

}

