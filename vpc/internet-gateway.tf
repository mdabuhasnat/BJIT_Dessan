resource "aws_internet_gateway" "bjit-vpc-internet-gateway" {
  vpc_id = "${aws_vpc.bjit-vpc.id}"

  tags = {
    Name = "bjit-vpc-internet-gateway"
  }
}
