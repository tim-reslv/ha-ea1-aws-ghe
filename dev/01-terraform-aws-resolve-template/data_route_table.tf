data "aws_route_table" "route_tables" {
  for_each = var.data_route_tables

  subnet_id  = each.value.subnet_id_ref != null ? [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if key == each.value.subnet_id_ref][0] : null
  gateway_id = each.value.gateway_id_ref != null ? [for key, value in merge(aws_internet_gateway.internet_gateways, data.aws_internet_gateway.internet_gateways) : value.id if key == each.value.gateway_id_ref][0] : null
}
