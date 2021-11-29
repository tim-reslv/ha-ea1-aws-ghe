resource "aws_vpc_dhcp_options_association" "dhcp_options" {
  for_each = var.dhcp_options

  vpc_id          = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  dhcp_options_id = aws_vpc_dhcp_options.dhcp_options[each.key].id
}
