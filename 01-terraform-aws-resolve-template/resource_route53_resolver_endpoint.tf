resource "aws_route53_resolver_endpoint" "route53_resolver_endpoints" {
  for_each = var.route53_resolver_endpoints

  name      = each.key
  direction = each.value.direction

  security_group_ids = [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if contains(each.value.security_group_ids_refs, key)]

  dynamic "ip_address" {
    for_each = each.value.ip_address

    content {
      subnet_id = [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if key == each.value.subnet_id_ref][0]
      ip        = ip_address.value.ip
    }
  }
  tags = each.value.tags
}
