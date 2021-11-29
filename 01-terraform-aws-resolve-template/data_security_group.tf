data "aws_security_group" "security_groups" {
  for_each = var.data_security_groups

  vpc_id = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  name   = each.value.name
}
