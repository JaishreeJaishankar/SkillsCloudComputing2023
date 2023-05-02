output "alb_dns_name" {
  value = module.alb.alb_dns
}

output "ecs_alb_dns_name" {
  value = module.ecs.ecs_alb_dns
}