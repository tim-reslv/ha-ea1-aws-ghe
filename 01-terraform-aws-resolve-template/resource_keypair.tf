resource "aws_key_pair" "key_pairs" {
  for_each = var.key_pairs

  key_name   = each.key
  public_key = tls_private_key.private_keys[each.value.public_key_ref].public_key_openssh
  tags       = each.value.tags
}
