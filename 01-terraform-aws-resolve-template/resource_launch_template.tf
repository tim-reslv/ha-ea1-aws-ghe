resource "aws_launch_template" "launch_templates" {
  for_each = var.launch_templates

  name        = each.value.name
  description = each.value.description
  key_name    = aws_key_pair.key_pairs[each.value.key_name_ref].key_name
  dynamic "block_device_mappings" {
    for_each = each.value.block_device_mappings

    content {
      device_name = block_device_mappings.value.device_name

      ebs {
        delete_on_termination = block_device_mappings.value.delete_on_termination
        encrypted             = block_device_mappings.value.encrypted
        iops                  = block_device_mappings.value.iops
        kms_key_id            = block_device_mappings.value.encrypted ? aws_kms_key.kms_keys[block_device_mappings.value.kms_key_id_ref].arn : null
        throughput            = block_device_mappings.value.throughput
        volume_type           = block_device_mappings.value.volume_type
        volume_size           = block_device_mappings.value.volume_size
      }
    }
  }
  tags = each.value.tags
  tag_specifications {
    resource_type = "instance"
    tags          = each.value.tags
  }
  tag_specifications {
    resource_type = "volume"
    tags          = each.value.tags
  }
  update_default_version = each.value.update_default_version
  vpc_security_group_ids = [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if contains(each.value.vpc_security_group_ids_refs, key)]

  lifecycle {
    ignore_changes = [
      vpc_security_group_ids
    ]
  }
}
