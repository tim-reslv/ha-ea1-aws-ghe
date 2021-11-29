resource "aws_security_group_rule" "security_group_rules" {
  for_each = var.security_group_rules

  security_group_id = [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if key == each.value.security_group_id_ref][0]
  type              = each.value.type

  description = each.value.description

  protocol  = each.value.protocol
  from_port = each.value.from_port
  to_port   = each.value.to_port

  cidr_blocks              = length(each.value.cidr_blocks) != 0 ? each.value.cidr_blocks : null
  ipv6_cidr_blocks         = length(each.value.ipv6_cidr_blocks) != 0 ? each.value.ipv6_cidr_blocks : null
  source_security_group_id = each.value.source_security_group_id_ref != null ? [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if key == each.value.source_security_group_id_ref][0] : null
  self                     = each.value.self ? true : null
}
