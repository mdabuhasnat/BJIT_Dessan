resource "aws_route_table" "bjit-vpc-route-table" {
  vpc_id = "${aws_vpc.bjit-vpc.id}"

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = "${aws_internet_gateway.bjit-vpc-internet-gateway.id}"
  }

  tags = {
    Name = "bjit-vpc-route-table"
  }
}

resource "aws_route_table_association" "bjit-vpc-route-table-association1" {
  subnet_id      = "${aws_subnet.main-public-1.id}"
  route_table_id = "${aws_route_table.bjit-vpc-route-table.id}"
}

resource "aws_route_table_association" "bjit-vpc-route-table-association2" {
  subnet_id      = "${aws_subnet.main-public-2.id}"
  route_table_id = "${aws_route_table.bjit-vpc-route-table.id}"
}


resource "aws_route_table_association" "bjit-vpc-route-table-association3" {
  subnet_id      = "${aws_subnet.main-public-3.id}"
  route_table_id = "${aws_route_table.bjit-vpc-route-table.id}"
}
