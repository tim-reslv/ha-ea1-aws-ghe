resource "aws_vpc_endpoint" "vpc_endpoints" {
  for_each = var.vpc_endpoints

  service_name        = each.value.service_name_ref != null ? aws_vpc_endpoint_service.vpc_endpoint_services[each.value.service_name_ref].service_name : each.value.service_name
  vpc_id              = each.value.vpc_id_ref != null ? [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0] : null
  auto_accept         = each.value.auto_accept
  policy              = each.value.policy_ref != null ? data.template_file.files[each.value.policy_ref].rendered : null
  private_dns_enabled = each.value.private_dns_enabled
  route_table_ids     = length(each.value.route_table_ids_refs) != 0 ? [for key, value in merge(aws_route_table.route_tables, data.aws_route_table.route_tables) : value.id if contains(each.value.route_table_id_refs, key)] : null
  subnet_ids          = length(each.value.subnet_ids_refs) != null ? [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if contains(each.value.subnet_ids_refs, key)] : null
  security_group_ids  = length(each.value.security_group_ids_refs) != 0 ? [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if contains(each.value.security_group_ids_refs, key)] : null
  tags                = each.value.tags
  vpc_endpoint_type   = each.value.vpc_endpoint_type
}
