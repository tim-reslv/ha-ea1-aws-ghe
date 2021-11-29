resource "aws_vpn_gateway_attachment" "vpn_gateway_attachments" {
  for_each = var.vpn_gateway_attachments

  vpc_id         = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  vpn_gateway_id = aws_vpn_gateway.vpn_gateways[each.value.vpn_gateway_id_ref].id
}
