resource "aws_route_table" "route_tables" {
  for_each = var.route_tables

  vpc_id = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  tags   = each.value.tags
}
