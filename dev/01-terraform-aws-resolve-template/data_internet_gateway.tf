data "aws_internet_gateway" "internet_gateways" {
  for_each = var.data_internet_gateways

  internet_gateway_id = each.value.internet_gateway_id
  tags                = each.value.tags
  dynamic "filter" {
    for_each = each.value.filter

    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}
