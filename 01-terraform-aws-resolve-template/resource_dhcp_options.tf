resource "aws_vpc_dhcp_options" "dhcp_options" {
  for_each = var.dhcp_options

  domain_name         = each.value.domain_name
  domain_name_servers = each.value.domain_name_servers
  ntp_servers         = each.value.ntp_servers
  tags                = each.value.tags
}
