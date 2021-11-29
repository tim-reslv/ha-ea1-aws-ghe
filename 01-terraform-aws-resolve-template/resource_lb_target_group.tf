resource "aws_lb_target_group" "lb_target_groups" {
  for_each = var.lb_target_groups

  deregistration_delay = each.value.deregistration_delay
  dynamic "health_check" {
    for_each = each.value.health_check.enabled ? { "health_check" = each.value.health_check } : {}

    content {
      enabled             = each.value.health_check.enabled
      healthy_threshold   = each.value.health_check.healthy_threshold
      interval            = each.value.health_check.interval
      matcher             = each.value.health_check.matcher
      path                = each.value.health_check.path
      port                = each.value.health_check.port
      protocol            = each.value.health_check.protocol
      timeout             = each.value.health_check.timeout
      unhealthy_threshold = each.value.health_check.unhealthy_threshold
    }
  }
  load_balancing_algorithm_type = each.value.load_balancing_algorithm_type
  name                          = each.key
  port                          = each.value.port
  preserve_client_ip            = each.value.preserve_client_ip
  protocol_version              = each.value.protocol_version
  protocol                      = each.value.protocol
  proxy_protocol_v2             = each.value.proxy_protocol_v2
  slow_start                    = each.value.slow_start
  dynamic "stickiness" {
    for_each = each.value.stickiness.enabled ? { "stickiness" = each.value.stickiness } : {}

    content {
      enabled         = each.value.stickiness.enabled
      cookie_duration = each.value.stickiness.cookie_duration
      type            = each.value.stickiness.type
    }
  }
  target_type = each.value.target_type
  vpc_id      = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0]
  tags        = each.value.tags
}
