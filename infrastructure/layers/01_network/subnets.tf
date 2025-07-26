resource "aws_subnet" "alb" {
  count = length(local.alb_subnet_cidr_blocks)

  vpc_id            = aws_vpc.main.id
  cidr_block        = local.alb_subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name       = "${local.alb_subnet_name}-${data.aws_availability_zones.available.names[count.index]}"
    SubnetName = local.alb_subnet_name
  }
}
