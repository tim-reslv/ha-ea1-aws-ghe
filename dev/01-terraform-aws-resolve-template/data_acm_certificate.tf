data "aws_acm_certificate" "acm_certificates" {
  for_each = var.data_acm_certificates

  domain      = each.value.domain
  key_types   = each.value.key_types
  statuses    = each.value.statuses
  types       = each.value.types
  most_recent = each.value.most_recent
}
