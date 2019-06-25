resource "aws_subnet" "main-public-1" {
    vpc_id = "${aws_vpc.bjit-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-1a"

    tags= {
        Name = "bjit-public-1a"
    }
}
resource "aws_subnet" "main-public-2" {
    vpc_id = "${aws_vpc.bjit-vpc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-1b"

    tags ={
        Name = "bjit-public-2b"
    }
}
resource "aws_subnet" "main-public-3" {
     vpc_id = "${aws_vpc.bjit-vpc.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-southeast-1c"

    tags= {
        Name = "bjit-public-3c"
    }
}
resource "aws_subnet" "main-private-1" {
      vpc_id = "${aws_vpc.bjit-vpc.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-southeast-1a"

    tags ={
        Name = "bjit-private-1a"
    }
}
resource "aws_subnet" "main-private-2" {
     vpc_id = "${aws_vpc.bjit-vpc.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-southeast-1b"

    tags ={
        Name = "bjit-private-2b"
    }
}
resource "aws_subnet" "main-private-3" {
     vpc_id = "${aws_vpc.bjit-vpc.id}"
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "ap-southeast-1c"

    tags ={
        Name = "bjit-private-3c"
    }
}



output "subnet1_public_id" {
  value = "${aws_subnet.main-public-1.id}"
}
output "subnet2_public_id" {
  value = "${aws_subnet.main-public-2.id}"
}
output "subnet3_public_id" {
  value = "${aws_subnet.main-public-3.id}"
}


output "subnet1_private_id" {
  value = "${aws_subnet.main-private-1.id}"
}

output "subnet2_private_id" {
  value = "${aws_subnet.main-private-2.id}"
}

output "subnet3_private_id" {
  value = "${aws_subnet.main-private-3.id}"
}

# output "private_subnets" {
#   value = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
# }






output "subnet1_public_cidr" {
  value = "${aws_subnet.main-public-1.cidr_block}"
}
output "subnet2_public_cidr" {
  value = "${aws_subnet.main-public-2.cidr_block}"
}

output "subnet3_public_cidr" {
  value = "${aws_subnet.main-public-3.cidr_block}"
}

output "subnet1_private_cidr" {
  value = "${aws_subnet.main-private-1.cidr_block}"
}

output "subnet2_private_cidr" {
  value = "${aws_subnet.main-private-2.cidr_block}"
}
output "subnet3_private_cidr" {
  value = "${aws_subnet.main-private-3.cidr_block}"
}
