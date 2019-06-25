resource "aws_autoscaling_group" "ecs-autoscaling-group" {
    name                        = "${var.autoscaling-group-name}"
    max_size                    = "${var.max-instance-size}"
    min_size                    = "${var.min-instance-size}"
    desired_capacity            = "${var.desired-capacity}"
    vpc_zone_identifier         = ["${var.subnet2_public_id}", "${var.subnet3_public_id}"]

    launch_configuration        = "${aws_launch_configuration.elb-launch-configuration.name}"
    health_check_type           = "ELB"
    health_check_grace_period = "${var.health-check-grace-period}"
    load_balancers = ["${aws_elb.bjit-elb.name}"]
    force_delete = true

/*
   tags ={
      key = "Name"
      value = "ec2 instance"
      propagate_at_launch = true
   }
*/
    
}


