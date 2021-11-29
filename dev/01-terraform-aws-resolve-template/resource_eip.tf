resource "aws_eip" "eips" {
  for_each = var.eips

  associate_with_private_ip = each.value.associate_with_private_ip
  instance                  = each.value.instance_ref != null ? aws_instance.instances[each.value.instance_ref].id : null
  network_interface         = each.value.network_interface_ref != null ? aws_network_interface.network_interfaces[each.value.network_interface_ref].id : null
  vpc                       = each.value.vpc
  tags                      = each.value.tags
}
