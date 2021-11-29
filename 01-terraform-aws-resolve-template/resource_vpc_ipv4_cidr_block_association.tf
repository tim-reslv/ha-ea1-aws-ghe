resource "aws_vpc_ipv4_cidr_block_association" "vpc_ipv4_cidr_block_associations" {
  for_each = var.vpc_ipv4_cidr_block_associations

  vpc_id     = each.value.vpc_id_ref != null ? [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0] : each.value.vpc_id
  cidr_block = each.value.cidr_block
}
