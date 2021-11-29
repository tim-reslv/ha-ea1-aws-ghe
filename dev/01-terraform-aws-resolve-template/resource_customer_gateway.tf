resource "aws_customer_gateway" "customer_gateways" {
  for_each = var.customer_gateways

  bgp_asn     = each.value.bgp_asn
  device_name = each.value.device_name
  ip_address  = each.value.ip_address
  type        = each.value.type
  tags        = each.value.tags
}
