resource "aws_network_interface_attachment" "network_interface_attachments" {
  for_each = var.network_interface_attachments

  instance_id          = aws_instance.instances[each.value.instance_id_ref].id
  network_interface_id = aws_network_interface.network_interfaces[each.value.network_interface_id_ref].id
  device_index         = each.value.device_index
}
