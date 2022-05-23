resource "aws_lb" "test" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group.id]
  subnets            = [aws_subnet.web-subnet-1.id, aws_subnet.web-subnet-2.id]

  enable_deletion_protection = false
  

  tags = {
    name= "alb instance"
  }
}

resource "aws_lb_target_group" "alb-target_group" {
  name        = "my-web-server"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id

 health_check {
    healthy_threshold    = 5
    interval             = 30
    matcher              = "200,302"
    path                 = "/"
    port                 = "traffic-port"
    protocol             = "HTTP"
    timeout              = 5
    unhealthy_threshold  = 2
  }
}