resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_vpc_attachment" {
  for_each = var.transit_gateway_vpc_attachments

  subnet_ids                                      = [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if contains(each.value.subnet_ids_refs, key)]
  transit_gateway_id                              = [for key, value in merge(aws_ec2_transit_gateway.transit_gateways, data.aws_ec2_transit_gateway.transit_gateways) : value.id if key == each.value.transit_gateway_id_ref][0]
  vpc_id                                          = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  appliance_mode_support                          = each.value.appliance_mode_support
  dns_support                                     = each.value.dns_support
  ipv6_support                                    = each.value.ipv6_support
  tags                                            = each.value.tags
  transit_gateway_default_route_table_association = each.value.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = each.value.transit_gateway_default_route_table_propagation
}
