resource "aws_vpn_gateway_route_propagation" "vpn_gateway_route_propagations" {
  for_each = var.vpn_gateway_route_propagations

  vpn_gateway_id = aws_vpn_gateway.vpn_gateways[each.value.vpn_gateway_id_ref].id
  route_table_id = [for key, value in merge(aws_route_table.route_tables, data.aws_route_table.route_tables) : value.id if key == each.value.route_table_id_ref][0]
}
