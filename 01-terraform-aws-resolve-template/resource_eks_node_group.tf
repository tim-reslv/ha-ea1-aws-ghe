resource "aws_eks_node_group" "eks_node_groups" {
  for_each = var.eks_node_groups

  cluster_name    = aws_eks_cluster.eks_clusters[each.value.cluster_name_ref].name
  node_group_name = each.value.node_group_name
  node_role_arn   = aws_iam_role.iam_roles[each.value.node_role_arn_ref].arn
  scaling_config {
    desired_size = each.value.scaling_config.desired_size
    max_size     = each.value.scaling_config.max_size
    min_size     = each.value.scaling_config.min_size
  }
  subnet_ids = [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if contains(each.value.subnet_ids_refs, key)]

  ami_type             = each.value.ami_type
  capacity_type        = each.value.capacity_type
  disk_size            = each.value.disk_size
  force_update_version = each.value.force_update_version
  instance_types       = each.value.instance_types
  labels               = each.value.labels
  dynamic "launch_template" {
    for_each = each.value.launch_template.name_ref != null ? { "launch_template" = each.value } : {}

    content {
      id      = aws_launch_template.launch_templates[each.value.launch_template.name_ref].id
      version = each.value.launch_template.version == null ? aws_launch_template.launch_templates[each.value.launch_template.name_ref].latest_version : each.value.launch_template.version
    }
  }
  release_version = each.value.release_version
  dynamic "remote_access" {
    for_each = each.value.remote_access.ec2_ssh_key_ref != null ? { "remote_access" = each.value } : {}

    content {
      ec2_ssh_key               = aws_key_pair.key_pairs[each.value.remote_access.ec2_ssh_key_ref].key_name
      source_security_group_ids = [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if contains(each.value.source_security_group_ids_refs, key)]
    }
  }
  tags    = each.value.tags
  version = each.value.version
}
