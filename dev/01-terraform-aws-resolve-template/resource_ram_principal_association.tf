resource "aws_ram_principal_association" "principal_associations" {
  for_each = var.ram_principal_associations

  principal          = each.value.principal
  resource_share_arn = aws_ram_resource_share.resource_shares[each.value.resource_share_arn_ref].arn
}
