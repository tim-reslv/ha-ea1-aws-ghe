resource "aws_eks_cluster" "eks_clusters" {
  for_each = var.eks_clusters

  name     = each.value.name
  role_arn = aws_iam_role.iam_roles[each.value.role_arn_ref].arn
  vpc_config {
    endpoint_private_access = each.value.vpc_config.endpoint_private_access
    endpoint_public_access  = each.value.vpc_config.endpoint_public_access
    public_access_cidrs     = each.value.vpc_config.public_access_cidrs
    security_group_ids      = [for key, value in merge(aws_security_group.security_groups, data.aws_security_group.security_groups) : value.id if contains(each.value.vpc_config.security_group_ids_refs, key)]
    subnet_ids              = [for key, value in merge(aws_subnet.subnets, data.aws_subnet.subnets) : value.id if contains(each.value.vpc_config.subnet_ids_refs, key)]
  }
  enabled_cluster_log_types = each.value.enabled_cluster_log_types
  dynamic "encryption_config" {
    for_each = each.value.encryption_config.provider.key_arn_ref != null ? { "encryption_config" = each.value } : {}

    content {
      provider {
        key_arn = aws_kms_key.kms_keys[each.value.encryption_config.provider.key_arn_ref].arn
      }
      resources = each.value.encryption_config.resource
    }
  }
  dynamic "kubernetes_network_config" {
    for_each = each.value.kubernetes_network_config.service_ipv4_cidr != null ? { "kubernetes_network_config" = each.value } : {}

    content {
      service_ipv4_cidr = each.value.kubernetes_network_config.service_ipv4_cidr
    }
  }
  tags    = each.value.tags
  version = each.value.version

  lifecycle {
    ignore_changes = [
      vpc_config[0].security_group_ids
    ]
  }
}
