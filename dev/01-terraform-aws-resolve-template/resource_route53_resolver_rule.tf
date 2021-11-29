resource "aws_route53_resolver_rule" "route53_resolver_rules" {
  for_each = var.route53_resolver_rules

  domain_name          = each.value.domain
  rule_type            = each.value.rule_type
  name                 = each.key
  resolver_endpoint_id = aws_route53_resolver_endpoint.route53_resolver_endpoints[each.value.resolver_endpoint_id_ref].id

  dynamic "target_ip" {
    for_each = each.value.target_ip

    content {
      ip   = target_ip.value.ip
      port = target_ip.value.port
    }

  }
  tags = each.value.tags
}
