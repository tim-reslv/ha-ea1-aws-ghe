resource "aws_docdb_subnet_group" "docdb_subnet_groups" {
  for_each = var.docdb_subnet_groups

  name        = each.value.db_subnet_group_name
  description = each.value.description
  subnet_ids  = [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if contains(each.value.subnet_ids_refs, key)]
  tags        = each.value.tags
}
