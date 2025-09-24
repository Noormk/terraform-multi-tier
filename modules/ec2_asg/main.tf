resource "aws_launch_template" "this" {
  name_prefix   = "app-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.asg_sg_id

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app-instance"
    }
  }
}

resource "aws_autoscaling_group" "this" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.private_subnet_ids
  target_group_arns    = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "app-asg"
    propagate_at_launch = true
  }
}
