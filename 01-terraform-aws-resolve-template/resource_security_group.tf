resource "aws_security_group" "security_groups" {
  for_each = var.security_groups

  name        = each.key
  description = each.value.description
  vpc_id      = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  tags        = each.value.tags
}
