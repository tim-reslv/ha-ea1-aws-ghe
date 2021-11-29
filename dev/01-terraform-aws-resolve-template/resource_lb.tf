resource "aws_lb" "lbs" {
  for_each = var.lbs

  name                       = each.value.name
  internal                   = each.value.internal
  load_balancer_type         = each.value.load_balancer_type
  security_groups            = each.value.security_groups_keys != null ? [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if key == each.value.security_groups_refs] : null
  drop_invalid_header_fields = each.value.drop_invalid_header_fields
  dynamic "access_logs" {
    for_each = each.value.access_logs.enabled ? { "access_logs" = each.value.access_logs } : {}

    content {
      bucket  = each.value.access_logs.bucket
      prefix  = each.value.access_logs.prefix
      enabled = each.value.access_logs.enabled
    }
  }
  subnets = each.value.subnets_refs != null ? [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if contains(each.value.subnets_refs, key)] : null
  dynamic "subnet_mapping" {
    for_each = each.value.subnets_refs == null ? { "subnet_mapping" = each.value.subnet_mapping } : {}

    content {
      subnet_id            = [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if key == each.value.subnet_id_ref][0]
      allocation_id        = [for key, value in merge(aws_eip.eips, data.aws_eip.eips) : value.id if key == each.value.allocation_id_ref][0]
      private_ipv4_address = subnet_mapping.value.private_ipv4_address
    }
  }
  idle_timeout                     = each.value.idle_timeout
  enable_deletion_protection       = each.value.enable_deletion_protection
  enable_cross_zone_load_balancing = each.value.enable_cross_zone_load_balancing
  enable_http2                     = each.value.enable_http2
  ip_address_type                  = each.value.ip_address_type
  tags                             = each.value.tags
}
