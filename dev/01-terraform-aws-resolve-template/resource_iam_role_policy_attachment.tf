resource "aws_iam_role_policy_attachment" "iam_role_policy_attachments" {
  for_each = var.iam_role_policy_attachments

  role       = aws_iam_role.iam_roles[each.value.role_ref].name
  policy_arn = each.value.policy_arn_ref != null ? aws_iam_policy.iam_polices[each.value.policy_arn_ref].arn : each.value.policy_arn
}
