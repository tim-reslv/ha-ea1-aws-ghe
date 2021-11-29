resource "aws_eip_association" "eip_associations" {
  for_each = var.eip_associations

  allocation_id        = [for key, value in merge(aws_eip.eips, data.aws_eip.eips) : value.id if key == each.value.allocation_id_ref][0]
  allow_reassociation  = each.value.allow_reassociation
  instance_id          = each.value.instance_id_ref != null ? aws_instance.instances[each.value.instance_id_ref].id : null
  network_interface_id = each.value.network_interface_id_ref != null ? aws_network_interface.network_interfaces[each.value.network_interface_id_ref].id : null
  private_ip_address   = each.value.private_ip_address
}
