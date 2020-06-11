resource "aws_security_group" "MySecurityGroup" {
  name        = "MySecurityGroup"
  vpc_id = "vpc-04934d1b464469e27"
  description = "Allow TLS inbound traffic"
  

ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}
################################################



##################################################

resource "aws_instance" "web" {
  ami           = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
  key_name = "DevOps Access"
  security_groups = ["MySecurityGroup"]
#  ebs_block_device = "Myebs"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Instance From TF"
  }
}


###########################################


resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.tfebs.id}"
  instance_id = "${aws_instance.web.id}"
}

