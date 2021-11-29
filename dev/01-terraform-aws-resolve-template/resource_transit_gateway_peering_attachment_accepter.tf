resource "aws_ec2_transit_gateway_peering_attachment_accepter" "transit_gateway_peering_attachment_accepters" {
  for_each = var.transit_gateway_peering_attachment_accepters

  transit_gateway_attachment_id = each.value.transit_gateway_attachment_id
  tags                          = each.value.tags
}
