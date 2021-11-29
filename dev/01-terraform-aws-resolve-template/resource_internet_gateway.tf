resource "aws_internet_gateway" "internet_gateways" {
  for_each = var.internet_gateways

  vpc_id = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  tags   = each.value.tags
}
