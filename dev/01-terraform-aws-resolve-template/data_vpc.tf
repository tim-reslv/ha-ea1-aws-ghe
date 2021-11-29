data "aws_vpc" "vpcs" {
  for_each = var.data_vpcs

  cidr_block = each.value.cidr_block
}
