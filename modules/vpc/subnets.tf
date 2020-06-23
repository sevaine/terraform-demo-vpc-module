resource "aws_subnet" "public-subnet" {
  count = length(var.public_cidrs)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_cidrs[count.index]
  availability_zone = "${var.region}${local.az_letters[count.index]}"
  tags = {
    Name = "public subnet - ${local.az_letters[count.index]}"
  }
}
resource "aws_subnet" "private-subnet" {
  count = length(var.private_cidrs)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_cidrs[count.index]
  availability_zone = "${var.region}${local.az_letters[count.index]}"
  tags = {
    Name = "private subnet - ${local.az_letters[count.index]}"
  }
}
