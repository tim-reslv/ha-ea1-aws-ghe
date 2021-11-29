data "aws_subnet" "subnets" {
  for_each = var.data_subnets

  availability_zone = join("", [var.aws_region, each.value.availability_zone])
  cidr_block        = each.value.cidr_block
}
