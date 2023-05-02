resource "aws_ecs_task_definition" "this" {
  family                   = "this-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.this.arn
  task_role_arn            = aws_iam_role.this.arn
  container_definitions = jsonencode([{
    name      = "this-container"
    image     = "379114597277.dkr.ecr.us-east-1.amazonaws.com/this-repo:latest"
    essential = true
    portMappings = [{
      protocol      = "tcp"
      containerPort = 5000
      hostPort      = 5000
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = aws_cloudwatch_log_group.this.name
        awslogs-region        = "us-east-1"
        awslogs-stream-prefix = "/aws/ecs"
      
      }
    }
  }])

  tags = {
    Name        = "this-task"
  }
}