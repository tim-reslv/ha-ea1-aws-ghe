resource "aws_ec2_transit_gateway_peering_attachment" "transit_gateway_peering_attachments" {
  for_each = var.transit_gateway_peering_attachments

  transit_gateway_id = data.aws_ec2_transit_gateway.transit_gateways[each.value.transit_gateway_id_key].id

  peer_account_id         = each.value.peer_account_id
  peer_region             = each.value.peer_region
  peer_transit_gateway_id = each.value.peer_transit_gateway_id
  tags                    = each.value.tags
}
