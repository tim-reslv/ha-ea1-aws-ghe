resource "aws_ec2_transit_gateway_route_table_association" "transit_gateway_route_table_associations" {
  for_each = {
    for key, value in var.transit_gateway_route_table_associations : key => value
    if value.type == "vpc"
  }

  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id == null ? [for key, value in merge(aws_ec2_transit_gateway_vpc_attachment.transit_gateway_vpc_attachment) : value.id if key == each.value.transit_gateway_attachment_id_ref][0] : each.value.transit_gateway_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_tables[each.value.transit_gateway_route_table_id_ref].id
}

resource "aws_ec2_transit_gateway_route_table_association" "vpn_transit_gateway_route_table_associations" {
  for_each = {
    for key, value in var.transit_gateway_route_table_associations : key => value
    if value.type == "vpn"
  }

  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id == null ? [for key, value in merge(aws_vpn_connection.vpn_connections) : value.transit_gateway_attachment_id if key == each.value.transit_gateway_attachment_id_ref][0] : each.value.transit_gateway_attachment_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.transit_gateway_route_tables[each.value.transit_gateway_route_table_id_ref].id
}
