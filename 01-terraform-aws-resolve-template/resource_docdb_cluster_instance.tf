resource "aws_docdb_cluster_instance" "docdb_cluster_instances" {
  for_each = var.docdb_cluster_instances

  apply_immediately            = each.value.apply_immediately
  auto_minor_version_upgrade   = each.value.auto_minor_version_upgrade
  availability_zone            = each.value.availability_zone
  cluster_identifier           = aws_docdb_cluster.docdb_clusters[each.value.cluster_identifier_ref].id
  engine                       = each.value.engine
  identifier                   = each.value.identifier
  instance_class               = each.value.instance_class
  preferred_maintenance_window = each.value.preferred_maintenance_window
  promotion_tier               = each.value.promotion_tier
  tags                         = each.value.tags
}
