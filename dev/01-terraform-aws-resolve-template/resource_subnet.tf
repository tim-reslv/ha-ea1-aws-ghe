resource "aws_subnet" "subnets" {
  for_each = var.subnets

  availability_zone               = join("", [var.aws_region, each.value.availability_zone])
  cidr_block                      = each.value.cidr_block
  ipv6_cidr_block                 = each.value.ipv6_cidr_block
  map_public_ip_on_launch         = each.value.map_public_ip_on_launch
  assign_ipv6_address_on_creation = false
  vpc_id                          = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  tags                            = each.value.tags
}
