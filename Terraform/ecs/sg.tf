module "ecs_service_sg" {
  source     = "cloudposse/security-group/aws"
  version    = "2.0.0-rc1"
  attributes = ["ecs-primary"]

  allow_all_egress = true

  rule_matrix = [
    {
      source_security_group_ids = [module.ecs_alb_sg.id]
      self                      = null
      rules = [
        {
          key         = "OTHERS"
          type        = "ingress"
          from_port   = 31000
          to_port     = 61000
          protocol    = "tcp"
          description = "Allow non privileged ports"
        },
        {
          key         = "HTTPALB"
          type        = "ingress"
          from_port   = 5000
          to_port     = 5000
          protocol    = "tcp"
          description = "Allow HTTP from ALB"
        }
      ]
    }
  ]

  vpc_id = var.vpc_id
}

module "ecs_alb_sg" {
  source     = "cloudposse/security-group/aws"
  version    = "2.0.0-rc1"
  attributes = ["ecs-alb"]

  allow_all_egress = true

  rules = [
    {
      key         = "HTTP"
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = null
      description = "Allow HTTP from everywhere"
    }
  ]

  vpc_id = var.vpc_id
}
