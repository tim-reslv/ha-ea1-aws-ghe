resource "aws_route" "routes" {
  for_each = var.routes

  route_table_id              = [for key, value in merge(aws_route_table.route_tables, data.aws_route_table.route_tables) : value.id if key == each.value.route_table_id_ref][0]
  destination_cidr_block      = each.value.destination_cidr_block
  destination_ipv6_cidr_block = each.value.destination_ipv6_cidr_block

  gateway_id                = each.value.gateway_id_ref != null ? [for key, value in merge(aws_internet_gateway.internet_gateways, data.aws_internet_gateway.internet_gateways) : value.id if key == each.value.gateway_id_ref][0] : null
  nat_gateway_id            = each.value.nat_gateway_id_ref != null ? aws_nat_gateway.nat_gateways[each.value.nat_gateway_id_ref].id : null
  transit_gateway_id        = each.value.transit_gateway_id_ref != null ? [for key, value in merge(aws_ec2_transit_gateway.transit_gateways, data.aws_ec2_transit_gateway.transit_gateways) : value.id if key == each.value.transit_gateway_id_ref][0] : null
  network_interface_id      = each.value.network_interface_id_ref != null ? aws_network_interface.network_interfaces[each.value.network_interface_id_ref].id : null
  vpc_endpoint_id           = each.value.vpc_endpoint_id_ref != null ? aws_vpc_endpoint.vpc_endpoints[each.value.vpc_endpoint_id_ref].id : null
  vpc_peering_connection_id = each.value.vpc_peering_connection_id_ref != null ? aws_vpc_peering_connection.vpc_peering_connections[each.value.vpc_peering_connection_id_ref].id : null
}
