data "aws_route53_zone" "route53_zones" {
  for_each = var.data_route53_zones

  name         = each.value.name
  private_zone = each.value.private_zone
}
