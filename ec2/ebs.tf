resource "aws_ebs_volume" "tfebs" {
  size              = 10
  availability_zone = "us-east-1a"
  tags = {
    Name = "EBS for Test"
  }
}
