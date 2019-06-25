variable "bastion_ami" {
    default="ami-0602ae7e6b9191aea" 
}

variable "bastion_instance_profile" {}

variable "subnet1_public_id" {
  description = "The VPC Subnet ID to launch in"
  default     = ""
}

variable "vpc-id" {}

# variable "security-group-id" {
#     default = ""
#     description= "For SSH HTTP HTTPS and engress free" 
# }


