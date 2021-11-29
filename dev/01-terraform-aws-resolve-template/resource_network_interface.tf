resource "aws_network_interface" "network_interfaces" {
  for_each = var.network_interfaces

  subnet_id         = [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if key == each.value.subnet_id_ref][0]
  description       = each.value.description
  private_ips       = each.value.private_ips
  ipv6_addresses    = each.value.ipv6_addresses
  security_groups   = [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if contains(each.value.security_groups_refs, key)]
  source_dest_check = each.value.source_dest_check
  tags              = each.value.tags
}
