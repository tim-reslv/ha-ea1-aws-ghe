resource "aws_lb_listener" "lb_listeners" {
  for_each = var.lb_listeners

  load_balancer_arn = aws_lb.lbs[each.value.load_balancer_arn_ref].arn
  alpn_policy       = each.value.alpn_policy
  certificate_arn   = each.value.certificate_arn_ref != null ? data.aws_acm_certificate.acm_certificates[each.value.certificate_arn_ref].arn : null
  port              = each.value.port
  protocol          = each.value.protocol
  ssl_policy        = each.value.ssl_policy

  dynamic "default_action" {
    for_each = each.value.default_action.forward

    content {
      type             = default_action.value.type
      target_group_arn = aws_lb_target_group.lb_target_groups[default_action.value.target_group_arn_ref].arn
    }
  }
  dynamic "default_action" {
    for_each = each.value.default_action.redirect

    content {
      type = default_action.value.type
      redirect {
        status_code = default_action.value.status_code
        host        = default_action.value.host
        path        = default_action.value.path
        port        = default_action.value.port
        protocol    = default_action.value.protocol
        query       = default_action.value.query
      }
    }
  }
}
