resource "aws_lb" "this" {
  name               = "this-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.ecs_alb_sg.id]
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name        = "this-alb"
  }
}

resource "aws_alb_target_group" "this" {
  name        = "this-tg"
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }

  tags = {
    Name        = "this-tg"
  }

  depends_on = [aws_lb.this]
}

resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.this.arn
    type             = "forward"
  }
  
}

