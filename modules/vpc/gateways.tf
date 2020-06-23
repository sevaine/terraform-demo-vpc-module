resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name} Internet Gateway"
  }
}

resource "aws_eip" "nat-gateway-eip" {
  count = length(var.public_cidrs)
  vpc = true
  depends_on = [aws_internet_gateway.internet-gateway]
  tags = {
    Name = "NAT Gateway EIP az-${local.az_letters[count.index]}"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  count = length(var.public_cidrs)
  allocation_id = aws_eip.nat-gateway-eip.*.id[count.index]
  subnet_id = aws_subnet.public-subnet.*.id[count.index]
  depends_on = [aws_internet_gateway.internet-gateway]
  tags = {
    Name = "NAT Gateway az-${local.az_letters[count.index]}"
  }
}
