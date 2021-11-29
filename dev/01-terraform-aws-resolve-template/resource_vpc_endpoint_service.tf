resource "aws_vpc_endpoint_service" "vpc_endpoint_services" {
  for_each = var.vpc_endpoint_services

  acceptance_required        = each.value.acceptance_required
  allowed_principals         = each.value.allowed_principals
  gateway_load_balancer_arns = length(each.value.gateway_load_balancer_arns_refs) != 0 ? [for key, value in merge(aws_lb.lbs) : value.arn if contains(each.value.gateway_load_balancer_arns_refs, key)] : null
  network_load_balancer_arns = length(each.value.network_load_balancer_arns_refs) != 0 ? [for key, value in merge(aws_lb.lbs) : value.arn if contains(each.value.network_load_balancer_arns_refs, key)] : null
  private_dns_name           = each.value.private_dns_name
  tags                       = each.value.tags
}
