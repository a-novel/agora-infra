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

resource "aws_route_table_association" "alb_internet" {
  count = length(local.alb_subnet_cidr_blocks)

  subnet_id      = aws_subnet.alb[count.index].id
  route_table_id = aws_route_table.public.id
}
