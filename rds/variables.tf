variable "environment" {
  description = "The environment"
}

variable "subnet_ids" {
  type        = "list"
  description = "Subnet ids"
}

variable "subnets" {
  description = "List of subnets DB should be available at. It might be one subnet."
  type        = "list"
}

# variable "private_subnets" {
#    value = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
#  }


variable "subnet3_private_id" {}
variable "subnet2_private_id" {}


variable "subnet2_public_id" {}
variable "subnet3_public_id" {}



variable "vpc_id" {
  description = "The VPC id"
}

//variable "allowed_security_group_id" {
//  description = "The allowed security group id to connect on RDS"
//}

variable "allocated_storage" {
  default     = "20"
  description = "The storage size in GB"
}

variable "instance_class" {
  description = "The instance type"
}

variable "multi_az" {
  default     = false
  description = "Muti-az allowed?"
}

variable "database_name" {
  default     = "dummy_data"
  description = "The database name"
}

variable "database_username" {
  default     = "admin"
  description = "The username of the database"
}

variable "database_password" {
  default     = "testing123"
  description = "The password of the database"
}
