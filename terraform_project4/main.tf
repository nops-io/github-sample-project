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

resource "aws_instance" "project4_ec2_instance_1" {
  ami           = "ami-2757f631"
  instance_type = "t2.medium"
  tags = {
    Name = "project4_instance_medium_1"
  }
}
resource "aws_instance" "project4_ec2_instance_2" {
  ami           = "ami-2757f631"
  instance_type = "t2.small"
  tags = {
    Name = "project4_instance_small_1"
  }

}

resource "aws_instance" "project4_ec2_instance_3" {
  ami           = "ami-2757f631"
  instance_type = "t2.medium"
  tags = {
    Name = "project4_instance_medium_2"
  }
}

