locals {
  vpc_name           = "${var.app_name}-${var.environment}-main"
  internal_zone_name = "${var.app_name}.${var.environment}.internal"
}

locals {
  alb_subnet_name = "${var.app_name}-${var.environment}-alb"
  alb_subnet_cidr_blocks = [
    "10.0.0.0/28",
    "10.0.0.16/28"
  ]
}
