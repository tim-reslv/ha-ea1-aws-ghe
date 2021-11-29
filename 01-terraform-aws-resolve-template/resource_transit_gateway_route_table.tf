resource "aws_ec2_transit_gateway_route_table" "transit_gateway_route_tables" {
  for_each = var.transit_gateway_route_tables

  transit_gateway_id = [for key, value in merge(aws_ec2_transit_gateway.transit_gateways, data.aws_ec2_transit_gateway.transit_gateways) : value.id if key == each.value.transit_gateway_id_ref][0]
  tags               = each.value.tags
}
