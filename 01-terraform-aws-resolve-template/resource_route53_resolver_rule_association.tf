resource "aws_route53_resolver_rule_association" "route53_resolver_rule_associations" {
  for_each = var.route53_resolver_rule_associations

  resolver_rule_id = each.value.resolver_rule_id_ref != null ? aws_route53_resolver_rule.route53_resolver_rules[each.value.resolver_rule_id_ref].id : each.value.resolver_rule_id
  vpc_id           = each.value.vpc_id_ref != null ? [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0] : each.value.vpc_id
}
