resource "aws_ecs_cluster" "this" {
  name = "this-cluster"

  tags = {
    Name = "this-fargate-cluster"
  }
}

resource "aws_ecs_service" "this" {
  name                               = "this-service"
  cluster                            = aws_ecs_cluster.this.id
  task_definition                    = aws_ecs_task_definition.this.arn
  desired_count                      = 2
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 60
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = [module.ecs_service_sg.id]
    subnets          = var.private_subnets
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.this.arn
    container_name   = "this-container"
    container_port   = 5000
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}
