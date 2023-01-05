
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "chanduvpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "chanduvpc"
  }
}

resource "aws_subnet" "myprivatesubnet" {
  vpc_id                  = aws_vpc.chanduvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "myprivatesubnet"
  }
}

