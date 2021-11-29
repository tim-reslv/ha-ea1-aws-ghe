resource "aws_vpn_gateway" "vpn_gateways" {
  for_each = var.vpn_gateways

  vpc_id            = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  availability_zone = each.value.availability_zone != null ? join("", [var.aws_region, each.value.availability_zone]) : null
  amazon_side_asn   = each.value.amazon_side_asn
  tags              = each.value.tags
}
