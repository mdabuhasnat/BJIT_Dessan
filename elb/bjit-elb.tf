

resource "aws_elb" "bjit-elb" {
  name = "bjit-elb"
  # subnets = ["${aws_subnet.subnet2_public_id}","${aws_subnet.subnet3_public_id}"]
  subnets = ["${var.subnet2_public_id}","${var.subnet3_public_id}"]
  security_groups = ["${aws_security_group.elb-securitygroup.id}"]
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags= {
    Name = "bjit-elb"
  }
}



# resource "aws_security_group" "myinstance" {
#   vpc_id = "${aws_vpc.vpc-id}"
#   name = "myinstance"
#   description = "security group for my instance"
#   egress {
#       from_port = 0
#       to_port = 0
#       protocol = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#       from_port = 22
#       to_port = 22
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#   } 

#   ingress {
#       from_port = 80
#       to_port = 80
#       protocol = "tcp"
#       security_groups = ["${aws_security_group.elb-securitygroup.id}"]
#   }

#   tags= {
#     Name = "myinstance"
#   }
# }

resource "aws_security_group" "elb-securitygroup" {
  vpc_id              = "${var.vpc-id}"
  name = "elb"
  description = "security group for load balancer"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
  tags= {
    Name = "elb"
  }
}


output "ELB" {
	value = "${aws_elb.bjit-elb.dns_name}"
}
