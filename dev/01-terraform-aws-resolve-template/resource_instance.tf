resource "aws_instance" "instances" {
  for_each = var.instances

  ami               = each.value.ami
  availability_zone = join("", [var.aws_region, each.value.availability_zone])
  credit_specification {
    cpu_credits = each.value.credit_specification.cpu_credits
  }
  disable_api_termination = each.value.disable_api_termination
  dynamic "ebs_block_device" {
    for_each = each.value.ebs_block_device

    content {
      delete_on_termination = ebs_block_device.value.delete_on_termination
      device_name           = ebs_block_device.value.device_name
      encrypted             = ebs_block_device.value.encrypted
      iops                  = ebs_block_device.value.iops
      kms_key_id            = ebs_block_device.value.encrypted ? aws_kms_key.kms_keys[ebs_block_device.value.kms_key_id_ref].arn : null
      snapshot_id           = ebs_block_device.value.snapshot_id
      tags                  = ebs_block_device.value.tags
      throughput            = ebs_block_device.value.throughput
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
    }
  }
  ebs_optimized                        = each.value.ebs_optimized
  hibernation                          = each.value.hibernation
  iam_instance_profile                 = each.value.iam_instance_profile_ref != null ? aws_iam_instance_profile.iam_instance_profiles[each.value.iam_instance_profile_ref].name : null
  instance_initiated_shutdown_behavior = each.value.instance_initiated_shutdown_behavior
  instance_type                        = each.value.instance_type
  key_name                             = aws_key_pair.key_pairs[each.value.key_name_ref].key_name
  monitoring                           = each.value.monitoring
  network_interface {
    network_interface_id = aws_network_interface.network_interfaces[each.value.network_interface_id_ref].id
    device_index         = 0
  }
  root_block_device {
    delete_on_termination = each.value.root_block_device.delete_on_termination
    encrypted             = each.value.root_block_device.encrypted
    iops                  = each.value.root_block_device.iops
    kms_key_id            = each.value.root_block_device.encrypted ? aws_kms_key.kms_keys[each.value.root_block_device.kms_key_id_ref].arn : null
    tags                  = each.value.root_block_device.tags
    throughput            = each.value.root_block_device.throughput
    volume_size           = each.value.root_block_device.volume_size
    volume_type           = each.value.root_block_device.volume_type
  }
  tags      = each.value.tags
  user_data = each.value.user_data_ref != null ? data.template_file.files[each.value.user_data_ref].rendered : null
}