resource "aws_ecs_cluster" "main" {
  name = local.ecs_cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = { Name = local.ecs_cluster_name }
}

resource "aws_ecs_cluster_capacity_providers" "fargate" {
  cluster_name       = aws_ecs_cluster.main.name
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 100
  }
}

resource "aws_service_discovery_private_dns_namespace" "local" {
  name        = local.service_discovery_dns_namespace
  description = "Local ECS service discovery namespace"
  vpc         = data.aws_vpc.main.id

  tags = { Name = local.service_discovery_dns_namespace }
}
