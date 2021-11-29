resource "aws_iam_user" "iam_users" {
  for_each = var.iam_users

  name          = each.value.name
  path          = each.value.path
  force_destroy = each.value.force_destroy
  tags          = each.value.tags
}
