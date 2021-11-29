resource "aws_lb_target_group_attachment" "lb_target_group_attachments" {
  for_each = var.lb_target_group_attachments

  target_group_arn = aws_lb_target_group.lb_target_groups[each.value.target_group_arn_ref].arn
  target_id        = each.value.target_id_ref != null ? aws_instance.instances[each.value.target_id_ref].id : each.value.target_id
  port             = each.value.port
}
