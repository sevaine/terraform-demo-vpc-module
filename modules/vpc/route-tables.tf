#
# public subnets route table
#
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name} public route table"
  }
}
resource "aws_route_table_association" "public-rtassoc" {
  count = length(aws_subnet.public-subnet.*.id)
  subnet_id = aws_subnet.public-subnet.*.id[count.index]
  route_table_id = aws_route_table.public.id
}

#
# private subnets route table
#
resource "aws_route_table" "private" {
  count = length(var.private_cidrs)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name} private route table ${local.az_letters[count.index]}"
  }
}
resource "aws_route_table_association" "private-rtassoc" {
  count = length(var.private_cidrs)
  subnet_id = aws_subnet.private-subnet.*.id[count.index]
  route_table_id = aws_route_table.private.*.id[count.index]
}
