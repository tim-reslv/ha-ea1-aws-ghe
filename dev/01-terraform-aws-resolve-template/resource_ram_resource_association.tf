resource "aws_ram_resource_association" "ec2_tansit_gateway_ram_resource_associations" {
  for_each = {
    for ram_key, ram_value in var.ram_resource_associations : ram_key => ram_value
    if ram_value.type == "ec2_tansit_gateway"
  }

  resource_arn       = [for key, value in merge(aws_ec2_transit_gateway.transit_gateways, data.aws_ec2_transit_gateway.transit_gateways) : value.arn if key == each.value.resource_arn_ref][0]
  resource_share_arn = aws_ram_resource_share.resource_shares[each.value.resource_share_arn_ref].arn
}

resource "aws_ram_resource_association" "route53_resolver_rule_ram_resource_associations" {
  for_each = {
    for ram_key, ram_value in var.ram_resource_associations : ram_key => ram_value
    if ram_value.type == "route53_resolver_rule"
  }

  resource_arn       = aws_route53_resolver_rule.route53_resolver_rules[each.value.resource_arn_ref].arn
  resource_share_arn = aws_ram_resource_share.resource_shares[each.value.resource_share_arn_ref].arn
}
