resource "aws_route53_vpc_association_authorization" "route53_vpc_association_authorizations" {
  for_each = var.route53_vpc_association_authorizations

  vpc_id     = each.value.vpc_id
  zone_id    = [for key, value in merge(aws_route53_zone.route53_zones, data.aws_route53_zone.route53_zones) : value.zone_id if key == each.value.zone_id_ref][0]
  vpc_region = each.value.vpc_region
}

