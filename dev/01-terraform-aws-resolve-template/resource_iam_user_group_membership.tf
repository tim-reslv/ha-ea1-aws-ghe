resource "aws_iam_user_group_membership" "iam_user_group_memberships" {
  for_each = var.iam_user_group_memberships

  user   = aws_iam_user.iam_users[each.value.user_ref].name
  groups = [for key, value in merge(aws_iam_group.iam_groups) : value.name if contains(each.value.groups_refs, key)]
}
