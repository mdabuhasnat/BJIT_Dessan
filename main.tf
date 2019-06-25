provider "aws" {
  region = "ap-southeast-1"
  access_key = "*****************"
  secret_key = "********************"
}


module "vpc" {
    source = "./vpc"
}

module "iam" {
    source = "./iam"
}
module "bastion" {
    source = "./bastion"
    vpc-id                      = "${module.vpc.id}"
    bastion_instance_profile          = "${module.iam.bastion_instance_profile}"
    subnet1_public_id                 = "${module.vpc.subnet1_public_id}"
    # security-group-id                = "${module.vpc.security-group-id}"

}


# module "route53" {
#     source = "./route53"
# }



# module "elb" {
#     source = "./elb"
#     vpc-id                      = "${module.vpc.id}"
#     security-group-id           = "${module.vpc.security-group-id}"
#     # rds-security-group          = "${module.rds.db_access_sg_id}"

#     subnet1_public_id                 = "${module.vpc.subnet1_public_id}"
#     subnet2_public_id                 = "${module.vpc.subnet2_public_id}"
#     subnet3_public_id                 = "${module.vpc.subnet3_public_id}"

# }


# module "rds" {
#   source            = "./rds"
#   environment       = "production"
#   allocated_storage = "20"


#   # database_name     = "${var.production_database_name}"
#   # database_username = "${var.production_database_username}"
#   # database_password = "${var.production_database_password}"
#   database_name     = "bjit"
#   database_username = "bjit"
#   database_password = "bjit1234"

#   # subnets = ["${module.vpc.subnet2_private_id}", "${module.vpc.subnet3_private_id}"]
#   # subnet_ids        = ["${module.vpc.subnet2_private_id}", "${module.vpc.subnet3_private_id}"]

#   #  subnet2_private_id ="${module.vpc.subnet2_private_id}"
#   #  subnet3_private_id= "${module.vpc.subnet3_private_id}"

#    subnet2_public_id                 = "${module.vpc.subnet2_public_id}"
#    subnet3_public_id                 = "${module.vpc.subnet3_public_id}"

#   vpc_id            = "${module.vpc.id}"
#   instance_class    = "db.t2.micro"
# }
 


# module "es" {
#     source = "./es"
#     vpc_id                      = "${module.vpc.id}"
#      # subnet_ids = ["${module.vpc.subnet2_private_id}", "${module.vpc.subnet3_private_id}"]
#      subnet_ids        = ["${module.vpc.subnet2_private_id}", "${module.vpc.subnet3_private_id}"]
    
#     # security-group-id           = "${module.vpc.security-group-id}"
#     # subnet_ids        = ["${module.vpc.private_subnets}"]
#       # subnet_ids = "module.vpc.subnet2_private_id"
    
#     # subnet1_public_id                 = "${module.vpc.subnet1_public_id}"
#     # subnet2_public_id                 = "${module.vpc.subnet2_public_id}"
#     # subnet3_public_id                 = "${module.vpc.subnet3_public_id}"    
# }
