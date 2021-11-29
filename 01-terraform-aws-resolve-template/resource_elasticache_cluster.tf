resource "aws_elasticache_cluster" "elasticache_clusters" {
  for_each = var.elasticache_clusters

  cluster_id                   = each.value.cluster_id
  replication_group_id         = each.value.replication_group_id
  engine                       = each.value.engine
  engine_version               = each.value.engine_version
  maintenance_window           = each.value.maintenance_window
  node_type                    = each.value.node_type
  num_cache_nodes              = each.value.num_cache_nodes
  parameter_group_name         = each.value.parameter_group_name
  port                         = each.value.port
  subnet_group_name            = each.value.subnet_group_name != null ? aws_elasticache_subnet_group.elasticache_subnet_groups[each.value.subnet_group_name].name : null
  security_group_ids           = [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if contains(each.value.security_group_ids_refs, key)]
  apply_immediately            = each.value.apply_immediately
  snapshot_arns                = each.value.snapshot_arns
  snapshot_name                = each.value.snapshot_name
  snapshot_window              = each.value.snapshot_window
  snapshot_retention_limit     = each.value.snapshot_retention_limit
  notification_topic_arn       = each.value.notification_topic_arn
  az_mode                      = each.value.az_mode
  availability_zone            = each.value.availability_zone
  preferred_availability_zones = each.value.preferred_availability_zones
  final_snapshot_identifier    = each.value.final_snapshot_identifier
  tags                         = each.value.tags

  lifecycle {
    ignore_changes = [
      snapshot_arns
    ]
  }
}
