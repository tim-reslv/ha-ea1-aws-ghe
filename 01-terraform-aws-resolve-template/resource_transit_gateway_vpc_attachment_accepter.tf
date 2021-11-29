resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "transit_gateway_vpc_attachment_accepter" {
  for_each = var.transit_gateway_vpc_attachment_accepters

  transit_gateway_attachment_id                   = each.value.transit_gateway_attachment_id_ref != null ? aws_ec2_transit_gateway_vpc_attachment.transit_gateway_vpc_attachment[each.value.transit_gateway_attachment_id_ref].id : each.value.transit_gateway_attachment_id
  transit_gateway_default_route_table_association = each.value.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = each.value.transit_gateway_default_route_table_propagation
  tags                                            = each.value.tags
}
