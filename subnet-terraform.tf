
resource "aws_instance" "myinstance" {
  count                  = 2
  ami                    = "ami-0d5d9d301c853a04a"
  instance_type          = "t2.micro"
  availability_zone      = element(data.aws_availability_zones.all.names, count.index)
  vpc_security_group_ids = ["${aws_security_group.myinstance.id}"]
  subnet_id              = aws_subnet.myprivatesubnet.id

  tags = {
    Name = "myinstance"
  }
}

resource "aws_security_group" "secgrp1" {
  vpc_id = aws_vpc.chanduvpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "myelb1" {
  name            = "myelb1"
  security_groups = ["${aws_security_group.myelb1.id}"]
  subnets         = ["${aws_subnet.myprivatesubnet.id}"]
  listener {
    instance_port     = 80
    instance_protocol = http
  }
}

