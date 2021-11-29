variable "data_template_files" {
  type    = map(any)
  default = {}
}

variable "random_passwords" {
  type    = map(any)
  default = {}
}

variable "tls_private_keys" {
  type    = map(any)
  default = {}
}

variable "aws_region" {
  type    = string
  default = "ap-east-1"
}

variable "data_acm_certificates" {
  type    = map(any)
  default = {}
}

variable "data_eips" {
  type    = map(any)
  default = {}
}

variable "data_internet_gateways" {
  type    = map(any)
  default = {}
}

variable "data_route_tables" {
  type    = map(any)
  default = {}
}

variable "data_route53_zones" {
  type    = map(any)
  default = {}
}

variable "data_security_groups" {
  type    = map(any)
  default = {}
}

variable "data_subnets" {
  type    = map(any)
  default = {}
}

variable "data_transit_gateways" {
  type    = map(any)
  default = {}
}

variable "data_vpcs" {
  type    = map(any)
  default = {}
}

variable "data_kms_keys" {
  type    = map(any)
  default = {}
}
variable "customer_gateways" {
  type    = map(any)
  default = {}
}

variable "db_instances" {
  type    = map(any)
  default = {}
}

variable "db_subnet_groups" {
  type    = map(any)
  default = {}
}

variable "dhcp_options" {
  type    = map(any)
  default = {}
}

variable "docdb_cluster_instances" {
  type    = map(any)
  default = {}
}

variable "docdb_clusters" {
  type    = map(any)
  default = {}
}

variable "docdb_subnet_groups" {
  type    = map(any)
  default = {}
}

variable "dynamodb_tables" {
  type    = map(any)
  default = {}
}

variable "ecr_repository_policies" {
  type    = map(any)
  default = {}
}

variable "ecr_repositories" {
  type    = map(any)
  default = {}
}

variable "eip_associations" {
  type    = map(any)
  default = {}
}

variable "elasticache_clusters" {
  type    = map(any)
  default = {}
}

variable "elasticache_subnet_groups" {
  type    = map(any)
  default = {}
}

variable "eks_clusters" {
  type    = map(any)
  default = {}
}

variable "eks_node_groups" {
  type    = map(any)
  default = {}
}

variable "eips" {
  type    = map(any)
  default = {}
}

variable "iam_group_policy_attachments" {
  type    = map(any)
  default = {}
}

variable "iam_groups" {
  type    = map(any)
  default = {}
}

variable "iam_instance_profiles" {
  type    = map(any)
  default = {}
}

variable "iam_polices" {
  type    = map(any)
  default = {}
}

variable "iam_role_policy_attachments" {
  type    = map(any)
  default = {}
}

variable "iam_roles" {
  type    = map(any)
  default = {}
}

variable "iam_user_group_memberships" {
  type    = map(any)
  default = {}
}

variable "iam_user_policy_attachments" {
  type    = map(any)
  default = {}
}

variable "iam_users" {
  type    = map(any)
  default = {}
}

variable "instances" {
  type    = map(any)
  default = {}
}

variable "internet_gateways" {
  type    = map(any)
  default = {}
}

variable "key_pairs" {
  type    = map(any)
  default = {}
}

variable "kms_keys" {
  type    = map(any)
  default = {}
}

variable "launch_templates" {
  type    = map(any)
  default = {}
}

variable "lb_listeners" {
  type    = map(any)
  default = {}
}

variable "lb_target_group_attachments" {
  type    = map(any)
  default = {}
}

variable "lb_target_groups" {
  type    = map(any)
  default = {}
}

variable "lbs" {
  type    = map(any)
  default = {}
}

variable "nat_gateways" {
  type    = map(any)
  default = {}
}

variable "network_interface_attachments" {
  type    = map(any)
  default = {}
}

variable "network_interfaces" {
  type    = map(any)
  default = {}
}

variable "ram_principal_associations" {
  type    = map(any)
  default = {}
}

variable "ram_resource_associations" {
  type    = map(any)
  default = {}
}

variable "ram_resource_shares" {
  type    = map(any)
  default = {}
}

variable "route53_records" {
  type    = map(any)
  default = {}
}

variable "route53_resolver_endpoints" {
  type    = map(any)
  default = {}
}

variable "route53_resolver_rule_associations" {
  type    = map(any)
  default = {}
}

variable "route53_resolver_rules" {
  type    = map(any)
  default = {}
}

variable "route53_vpc_association_authorizations" {
  type    = map(any)
  default = {}
}

variable "route53_zone_associations" {
  type    = map(any)
  default = {}
}

variable "route53_zones" {
  type    = map(any)
  default = {}
}

variable "route_tables" {
  type    = map(any)
  default = {}
}

variable "route_table_associations" {
  type    = map(any)
  default = {}
}

variable "routes" {
  type    = map(any)
  default = {}
}

variable "s3_bucket_public_access_blocks" {
  type    = map(any)
  default = {}
}

variable "s3_buckets" {
  type    = map(any)
  default = {}
}

variable "security_group_rules" {
  type    = map(any)
  default = {}
}

variable "security_groups" {
  type    = map(any)
  default = {}
}

variable "subnets" {
  type    = map(any)
  default = {}
}

variable "transit_gateway_peering_attachment_accepters" {
  type    = map(any)
  default = {}
}

variable "transit_gateway_peering_attachments" {
  type    = map(any)
  default = {}
}

variable "transit_gateway_route_table_associations" {
  type    = map(any)
  default = {}
}

variable "transit_gateway_route_table_propagations" {
  type    = map(any)
  default = {}
}

variable "transit_gateway_route_tables" {
  type    = map(any)
  default = {}
}

variable "transit_gateway_routes" {
  type    = map(any)
  default = {}
}

variable "transit_gateway_vpc_attachment_accepters" {
  type    = map(any)
  default = {}
}

variable "transit_gateway_vpc_attachments" {
  type    = map(any)
  default = {}
}

variable "transit_gateways" {
  type    = map(any)
  default = {}
}

variable "vpc_endpoint_services" {
  type    = map(any)
  default = {}
}

variable "vpc_endpoints" {
  type    = map(any)
  default = {}
}

variable "vpc_ipv4_cidr_block_associations" {
  type    = map(any)
  default = {}
}

variable "vpc_peering_connection_accepters" {
  type    = map(any)
  default = {}
}

variable "vpc_peering_connections" {
  type    = map(any)
  default = {}
}

variable "vpcs" {
  type    = map(any)
  default = {}
}

variable "vpn_connection_routes" {
  type    = map(any)
  default = {}
}

variable "vpn_connections" {
  type    = map(any)
  default = {}
}

variable "vpn_gateway_attachments" {
  type    = map(any)
  default = {}
}

variable "vpn_gateway_route_propagations" {
  type    = map(any)
  default = {}
}

variable "vpn_gateways" {
  type    = map(any)
  default = {}
}
