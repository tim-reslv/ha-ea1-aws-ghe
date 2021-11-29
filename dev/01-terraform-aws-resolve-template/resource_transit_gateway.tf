resource "aws_ec2_transit_gateway" "transit_gateways" {
  for_each = var.transit_gateways

  amazon_side_asn                 = each.value.amazon_side_asn
  auto_accept_shared_attachments  = each.value.auto_accept_shared_attachments
  default_route_table_association = each.value.default_route_table_association
  default_route_table_propagation = each.value.default_route_table_propagation
  description                     = each.value.description
  dns_support                     = each.value.dns_support
  vpn_ecmp_support                = each.value.vpn_ecmp_support
  tags                            = each.value.tags
}
