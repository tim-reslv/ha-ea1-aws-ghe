resource "aws_dynamodb_table" "dynamodb_tables" {
  for_each = var.dynamodb_tables

  name           = each.value.name
  billing_mode   = each.value.billing_mode
  hash_key       = each.value.hash_key
  range_key      = each.value.range_key
  read_capacity  = each.value.read_capacity
  write_capacity = each.value.write_capacity
  dynamic "attribute" {
    for_each = each.value.attribute

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
  dynamic "ttl" {
    for_each = each.value.ttl.enabled ? { "ttl" = each.value } : {}

    content {
      attribute_name = each.value.ttl.attribute_name
      enabled        = each.value.ttl.enabled
    }
  }
  dynamic "local_secondary_index" {
    for_each = each.value.local_secondary_index

    content {
      name               = local_secondary_index.value.name
      range_key          = local_secondary_index.value.range_key
      projection_type    = local_secondary_index.value.projection_type
      non_key_attributes = local_secondary_index.value.non_key_attributes
    }
  }
  dynamic "global_secondary_index" {
    for_each = each.value.global_secondary_index

    content {
      name               = global_secondary_index.value.name
      write_capacity     = global_secondary_index.value.write_capacity
      read_capacity      = global_secondary_index.value.read_capacity
      hash_key           = global_secondary_index.value.hash_key
      range_key          = global_secondary_index.value.range_key
      projection_type    = global_secondary_index.value.projection_type
      non_key_attributes = global_secondary_index.value.non_key_attributes
    }
  }
  dynamic "replica" {
    for_each = each.value.replica

    content {
      region_name = replica.value.region_name
      kms_key_arn = replica.value.kms_key_arn
    }
  }
  stream_enabled   = each.value.stream_enabled
  stream_view_type = each.value.stream_view_type
  server_side_encryption {
    enabled     = each.value.server_side_encryption.enabled
    kms_key_arn = each.value.server_side_encryption.kms_key_arn != null ? aws_kms_key.kms_keys[each.value.server_side_encryption.kms_key_arn_ref].arn : null
  }
  point_in_time_recovery {
    enabled = each.value.point_in_time_recovery.enabled
  }
  tags = each.value.tags

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity
    ]
  }
}
