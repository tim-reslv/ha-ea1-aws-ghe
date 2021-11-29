resource "aws_iam_group" "iam_groups" {
  for_each = var.iam_groups

  name = each.value.name
  path = each.value.path
}
