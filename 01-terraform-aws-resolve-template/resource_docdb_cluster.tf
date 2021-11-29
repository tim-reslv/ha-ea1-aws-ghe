resource "aws_docdb_cluster" "docdb_clusters" {
  for_each = var.docdb_clusters

  apply_immediately               = each.value.apply_immediately
  availability_zones              = each.value.availability_zones
  backup_retention_period         = each.value.backup_retention_period
  cluster_identifier              = each.value.cluster_identifier
  db_subnet_group_name            = aws_docdb_subnet_group.docdb_subnet_groups[each.value.db_subnet_group_name].name
  db_cluster_parameter_group_name = each.value.db_cluster_parameter_group_name
  deletion_protection             = each.value.deletion_protection
  enabled_cloudwatch_logs_exports = each.value.enabled_cloudwatch_logs_exports
  engine_version                  = each.value.engine_version
  engine                          = each.value.engine
  final_snapshot_identifier       = each.value.final_snapshot_identifier
  kms_key_id                      = each.value.kms_key_id_ref != null ? aws_kms_key.kms_keys[each.value.kms_key_id_ref].arn : null
  master_password                 = random_password.passwords[each.value.master_password_ref].result
  master_username                 = each.value.master_username
  port                            = each.value.port
  preferred_backup_window         = each.value.preferred_backup_window
  preferred_maintenance_window    = each.value.preferred_maintenance_window
  skip_final_snapshot             = each.value.skip_final_snapshot
  snapshot_identifier             = each.value.snapshot_identifier
  storage_encrypted               = each.value.storage_encrypted
  vpc_security_group_ids          = [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if contains(each.value.vpc_security_group_ids_refs, key)]
  tags                            = each.value.tags

  lifecycle {
    ignore_changes = [
      master_password
    ]
  }
}
