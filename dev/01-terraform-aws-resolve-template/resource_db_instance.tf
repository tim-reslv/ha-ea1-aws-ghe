resource "aws_db_instance" "db_instances" {
  for_each = var.db_instances

  allocated_storage                     = each.value.allocated_storage
  allow_major_version_upgrade           = each.value.allow_major_version_upgrade
  apply_immediately                     = each.value.apply_immediately
  auto_minor_version_upgrade            = each.value.auto_minor_version_upgrade
  availability_zone                     = each.value.multi_az ? null : join("", [var.aws_region, each.value.availability_zone])
  backup_retention_period               = each.value.backup_retention_period
  backup_window                         = each.value.backup_window
  ca_cert_identifier                    = each.value.ca_cert_identifier
  character_set_name                    = each.value.character_set_name
  copy_tags_to_snapshot                 = each.value.copy_tags_to_snapshot
  db_subnet_group_name                  = each.value.db_subnet_group_name != null ? aws_db_subnet_group.db_subnet_groups[each.value.db_subnet_group_name].name : null
  delete_automated_backups              = each.value.delete_automated_backups
  deletion_protection                   = each.value.deletion_protection
  domain                                = each.value.domain
  domain_iam_role_name                  = each.value.domain_iam_role_name
  enabled_cloudwatch_logs_exports       = each.value.enabled_cloudwatch_logs_exports
  engine                                = each.value.engine
  engine_version                        = each.value.engine_version
  final_snapshot_identifier             = each.value.final_snapshot_identifier
  iam_database_authentication_enabled   = each.value.iam_database_authentication_enabled
  identifier                            = each.value.identifier
  instance_class                        = each.value.instance_class
  iops                                  = each.value.iops
  kms_key_id                            = each.value.kms_key_id_ref != null ? aws_kms_key.kms_keys[each.value.kms_key_id_ref].arn : null
  license_model                         = each.value.license_model
  maintenance_window                    = each.value.maintenance_window
  max_allocated_storage                 = each.value.max_allocated_storage
  monitoring_interval                   = each.value.monitoring_interval
  monitoring_role_arn                   = each.value.monitoring_role_arn_ref != null ? aws_iam_role.iam_roles[each.value.monitoring_role_arn_ref].arn : null
  multi_az                              = each.value.multi_az
  name                                  = each.value.name
  option_group_name                     = each.value.option_group_name
  parameter_group_name                  = each.value.parameter_group_name
  password                              = each.value.password_ref != null ? random_password.passwords[each.value.password_ref].result : null
  performance_insights_enabled          = each.value.performance_insights_enabled
  performance_insights_kms_key_id       = each.value.performance_insights_kms_key_id_ref != null ? aws_kms_key.kms_keys[each.value.performance_insights_kms_key_id_ref].arn : null
  performance_insights_retention_period = each.value.performance_insights_retention_period
  port                                  = each.value.port
  publicly_accessible                   = each.value.publicly_accessible
  replicate_source_db                   = each.value.replicate_source_db
  skip_final_snapshot                   = each.value.skip_final_snapshot
  snapshot_identifier                   = each.value.snapshot_identifier
  storage_encrypted                     = each.value.storage_encrypted
  storage_type                          = each.value.storage_type
  timezone                              = each.value.timezone
  username                              = each.value.username
  vpc_security_group_ids                = [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if contains(each.value.vpc_security_group_ids_refs, key)]
  tags                                  = each.value.tags

  lifecycle {
    ignore_changes = [
      snapshot_identifier,
      password
    ]
  }
}
