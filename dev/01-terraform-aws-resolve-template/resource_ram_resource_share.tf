resource "aws_ram_resource_share" "resource_shares" {
  for_each = var.ram_resource_shares

  name                      = each.value.name
  allow_external_principals = each.value.allow_external_principals
  tags                      = each.value.tags
}
