data "aws_ec2_transit_gateway" "transit_gateways" {
  for_each = var.data_transit_gateways

  id = each.value.id

  dynamic "filter" {
    for_each = each.value.filter

    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}
