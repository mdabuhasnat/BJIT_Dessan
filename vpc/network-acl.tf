resource "aws_network_acl" "bjit-vpc-network-acl" {
    vpc_id = "${aws_vpc.bjit-vpc.id}"
    subnet_ids = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}","${aws_subnet.main-public-3.id}"]

    egress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    tags= {
        Name = "demo-vpc-network-acl"
    }
}
