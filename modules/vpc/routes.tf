#
# Default route for public subnets via internet gateway
#
resource "aws_route" "default" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.internet-gateway.id
}
#
# Default route for private subnets via their respective NAT Gateway.
#
resource "aws_route" "private_default" {
  count = length(var.private_cidrs)
  route_table_id = aws_route_table.private.*.id[count.index]
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat-gateway.*.id[count.index]
}
