resource "aws_vpc_peering_connection_accepter" "vpc_peering_connection_accepters" {
  for_each = var.vpc_peering_connection_accepters

  vpc_peering_connection_id = each.value.vpc_peering_connection_id_ref != null ? [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_peering_connection_id_ref][0] : each.value.vpc_peering_connection_id
  auto_accept               = each.value.auto_accept
  tags                      = each.value.tags
}
