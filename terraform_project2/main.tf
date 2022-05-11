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

resource "aws_instance" "project2_ec2_instance_1" {
  ami           = "ami-2757f631"
  instance_type = "t2.large"
  tags = {
    Name = "project2_instance_large_1"
  }
}
resource "aws_instance" "project2_ec2_instance_2" {
  ami           = "ami-2757f631"
  instance_type = "t2.xlarge"
  tags = {
    Name = "project2_instance_xlarge_1"
  }

}

