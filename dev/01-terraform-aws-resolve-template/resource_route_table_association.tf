resource "aws_route_table_association" "route_table_associations" {
  for_each = var.route_table_associations

  subnet_id      = each.value.subnet_id_ref != null ? [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if key == each.value.subnet_id_ref][0] : null
  gateway_id     = each.value.gateway_id_ref != null ? [for key, value in merge(aws_internet_gateway.internet_gateways, data.aws_internet_gateway.internet_gateways) : value.id if key == each.value.gateway_id_ref][0] : null
  route_table_id = [for key, value in merge(aws_route_table.route_tables, data.aws_route_table.route_tables) : value.id if key == each.value.route_table_id_ref][0]
}
