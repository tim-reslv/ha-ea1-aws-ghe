resource "aws_iam_group_policy_attachment" "iam_group_policy_attachments" {
  for_each = var.iam_group_policy_attachments

  group      = aws_iam_group.iam_groups[each.value.group_ref].name
  policy_arn = each.value.policy_arn_ref != null ? aws_iam_policy.iam_polices[each.value.policy_arn_ref].arn : each.value.policy_arn
}
