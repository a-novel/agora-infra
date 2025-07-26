data "aws_vpc" "main" {
  state = "available"
  tags  = { Name = "${var.app_name}-${var.environment}-main" }
}
