output "ecs_alb_security_group" {
  value = module.ecs_alb_sg.id
}

output "ecs_alb_dns" {
  description = "ECS ALB DNS"
  value       = aws_lb.this.dns_name
}

output "ecs_sg"{
  value = module.ecs_service_sg.id
}