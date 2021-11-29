resource "aws_route53_record" "route53_records" {
  for_each = var.route53_records

  zone_id = [for key, value in merge(aws_route53_zone.route53_zones, data.aws_route53_zone.route53_zones) : value.zone_id if key == each.value.zone_id_ref][0]
  name    = join(".", [each.value.name, [for key, value in merge(aws_route53_zone.route53_zones, data.aws_route53_zone.route53_zones) : value.name if key == each.value.zone_id_ref][0]])
  type    = each.value.type
  ttl     = each.value.ttl
  records = each.value.records
}
