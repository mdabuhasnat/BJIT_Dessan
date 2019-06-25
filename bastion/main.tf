

  resource "aws_instance" "bastion_instancd" {
  ami = "${var.bastion_ami}"
  instance_type = "t2.micro"
  iam_instance_profile = "${var.bastion_instance_profile}"
  key_name = "SingapurKeyPair"
  subnet_id = "${var.subnet1_public_id}"
#   security_groups ="${aws_security_group.bjit-vpc-security-group.id}"
  
   tags = {
    Name = "bastion_host"
  }
}  


# resource "aws_security_group" "bjit-vpc-security-group" {
#     name        = "demo-vpc-security-group"
#     description = "Allow HTTP, HTTPS, and SSH"
#     vpc_id = "${aws_vpc.bjit-vpc.id}"

#     // HTTP
#     ingress {
#         from_port = 80
#         to_port = 80
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     // HTTPS
#     ingress {
#         from_port = 443
#         to_port = 443
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     // SSH
#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
# }


