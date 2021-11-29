resource "aws_vpc" "vpcs" {
  for_each = var.vpcs

  cidr_block                       = each.value.cidr_block
  instance_tenancy                 = each.value.instance_tenancy != null ? "default" : each.value.instance_tenancy
  enable_dns_support               = each.value.enable_dns_support
  enable_dns_hostnames             = each.value.enable_dns_hostnames
  assign_generated_ipv6_cidr_block = each.value.assign_generated_ipv6_cidr_block
  tags                             = each.value.tags
}
