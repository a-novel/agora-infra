resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = { Name = local.vpc_name }
}

resource "aws_default_security_group" "deny_all" {
  vpc_id = aws_vpc.main.id

  tags = { Name = "${local.vpc_name}-deny-all" }
}

resource "aws_route53_zone" "internal" {
  name = local.internal_zone_name

  vpc { vpc_id = aws_vpc.main.id }

  tags = { Name = local.internal_zone_name }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = { Name = local.vpc_name }
}

resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  tags = { Name = "${local.vpc_name}-default-route-table" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = { Name = "${local.vpc_name}-public-route-table" }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}
