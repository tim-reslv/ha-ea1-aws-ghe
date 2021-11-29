resource "aws_iam_user_policy_attachment" "iam_user_policy_attachments" {
  for_each = var.iam_user_policy_attachments

  user       = aws_iam_user.iam_users[each.value.user_ref].name
  policy_arn = each.value.policy_arn_ref != null ? aws_iam_policy.iam_polices[each.value.policy_arn_ref].arn : each.value.policy_arn
}
