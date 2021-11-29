resource "aws_route53_zone_association" "route53_zone_associations" {
  for_each = var.route53_zone_associations

  zone_id    = each.value.zone_id_ref != null ? [for key, value in merge(aws_route53_zone.route53_zones, data.aws_route53_zone.route53_zones) : value.zone_id if key == each.value.zone_id_ref][0] : each.value.zone_id
  vpc_id     = each.value.vpc_id_ref != null ? [for key, value in merge(aws_vpc.vpcs, data.aws_vpc.vpcs) : value.id if key == each.value.vpc_id_ref][0] : each.value.vpc_id
  vpc_region = each.value.vpc_region
}
