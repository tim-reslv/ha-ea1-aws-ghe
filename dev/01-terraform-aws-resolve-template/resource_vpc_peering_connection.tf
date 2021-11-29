resource "aws_vpc_peering_connection" "vpc_peering_connections" {
  for_each = var.vpc_peering_connections

  peer_region   = each.value.peer_region
  peer_owner_id = each.value.peer_owner_id
  peer_vpc_id   = each.value.peer_vpc_id_ref != null ? [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.peer_vpc_id_ref][0] : each.value.peer_vpc_id
  vpc_id        = each.value.vpc_id_ref != null ? [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0] : each.value.vpc_id_ref
  auto_accept   = each.value.auto_accept
  tags          = each.value.tags
}
