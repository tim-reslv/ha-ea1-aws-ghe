resource "aws_nat_gateway" "nat_gateways" {
  for_each = var.nat_gateways

  allocation_id = [for key, value in merge(aws_eip.eips, data.aws_eip.eips) : value.id if key == each.value.allocation_id_ref][0]
  subnet_id     = [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if key == each.value.subnet_id_ref][0]
  tags          = each.value.tags

  depends_on = [
    aws_internet_gateway.internet_gateways
  ]
}
