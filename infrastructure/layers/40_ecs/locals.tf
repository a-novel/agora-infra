locals {
  ecs_cluster_name                = "${var.app_name}-${var.environment}-main"
  service_discovery_dns_namespace = "${var.app_name}.local"
}
