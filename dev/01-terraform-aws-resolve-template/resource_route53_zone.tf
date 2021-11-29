resource "aws_route53_zone" "route53_zones" {
  for_each = var.route53_zones

  name    = each.value.name
  comment = each.value.comment

  dynamic "vpc" {
    for_each = each.value.vpcs

    content {
      vpc_id     = [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == vpc.value.vpc_id_ref][0]
      vpc_region = vpc.value.vpc_region
    }
  }
  tags = each.value.tags

  lifecycle {
    ignore_changes = [vpc]
  }
}
