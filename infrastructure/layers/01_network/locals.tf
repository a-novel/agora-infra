locals {
  vpc_name           = "${var.app_name}-${var.environment}-main"
  internal_zone_name = "${var.app_name}.${var.environment}.internal"
}
