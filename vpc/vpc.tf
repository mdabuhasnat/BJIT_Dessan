resource "aws_vpc" "bjit-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_classiclink = "false"

  tags ={
    Name = "bjit-vpc"
  }
}

output "id" {
  value = "${aws_vpc.bjit-vpc.id}"
}
