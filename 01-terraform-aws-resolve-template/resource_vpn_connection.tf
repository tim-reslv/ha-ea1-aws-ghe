resource "aws_vpn_connection" "vpn_connections" {
  for_each = var.vpn_connections

  customer_gateway_id = aws_customer_gateway.customer_gateways[each.value.customer_gateway_id_ref].id
  type                = each.value.type
  transit_gateway_id  = each.value.transit_gateway_id_ref != null ? [for key, value in merge(aws_ec2_transit_gateway.transit_gateways, data.aws_ec2_transit_gateway.transit_gateways) : value.id if key == each.value.transit_gateway_id_ref][0] : null
  vpn_gateway_id      = each.value.vpn_gateway_id_ref != null ? aws_vpn_gateway.vpn_gateways[each.value.vpn_gateway_id_ref].id : null

  static_routes_only                   = each.value.static_routes_only
  enable_acceleration                  = each.value.enable_acceleration
  tags                                 = each.value.tags
  local_ipv4_network_cidr              = each.value.local_ipv4_network_cidr
  local_ipv6_network_cidr              = each.value.local_ipv6_network_cidr
  remote_ipv4_network_cidr             = each.value.remote_ipv4_network_cidr
  remote_ipv6_network_cidr             = each.value.remote_ipv6_network_cidr
  tunnel_inside_ip_version             = each.value.tunnel_inside_ip_version
  tunnel1_inside_cidr                  = each.value.tunnel1_inside_cidr
  tunnel2_inside_cidr                  = each.value.tunnel2_inside_cidr
  tunnel1_inside_ipv6_cidr             = each.value.tunnel1_inside_ipv6_cidr
  tunnel2_inside_ipv6_cidr             = each.value.tunnel2_inside_ipv6_cidr
  tunnel1_preshared_key                = each.value.tunnel1_preshared_key
  tunnel2_preshared_key                = each.value.tunnel2_preshared_key
  tunnel1_dpd_timeout_action           = each.value.tunnel1_dpd_timeout_action
  tunnel2_dpd_timeout_action           = each.value.tunnel2_dpd_timeout_action
  tunnel1_dpd_timeout_seconds          = each.value.tunnel1_dpd_timeout_seconds
  tunnel2_dpd_timeout_seconds          = each.value.tunnel2_dpd_timeout_seconds
  tunnel1_ike_versions                 = each.value.tunnel1_ike_versions
  tunnel2_ike_versions                 = each.value.tunnel2_ike_versions
  tunnel1_phase1_dh_group_numbers      = each.value.tunnel1_phase1_dh_group_numbers
  tunnel2_phase1_dh_group_numbers      = each.value.tunnel2_phase1_dh_group_numbers
  tunnel1_phase1_encryption_algorithms = each.value.tunnel1_phase1_encryption_algorithms
  tunnel2_phase1_encryption_algorithms = each.value.tunnel2_phase1_encryption_algorithms
  tunnel1_phase1_integrity_algorithms  = each.value.tunnel1_phase1_integrity_algorithms
  tunnel2_phase1_integrity_algorithms  = each.value.tunnel2_phase1_integrity_algorithms
  tunnel1_phase1_lifetime_seconds      = each.value.tunnel1_phase1_lifetime_seconds
  tunnel2_phase1_lifetime_seconds      = each.value.tunnel2_phase1_lifetime_seconds
  tunnel1_phase2_dh_group_numbers      = each.value.tunnel1_phase2_dh_group_numbers
  tunnel2_phase2_dh_group_numbers      = each.value.tunnel2_phase2_dh_group_numbers
  tunnel1_phase2_encryption_algorithms = each.value.tunnel1_phase2_encryption_algorithms
  tunnel2_phase2_encryption_algorithms = each.value.tunnel2_phase2_encryption_algorithms
  tunnel1_phase2_integrity_algorithms  = each.value.tunnel1_phase2_integrity_algorithms
  tunnel2_phase2_integrity_algorithms  = each.value.tunnel2_phase2_integrity_algorithms
  tunnel1_phase2_lifetime_seconds      = each.value.tunnel1_phase2_lifetime_seconds
  tunnel2_phase2_lifetime_seconds      = each.value.tunnel2_phase2_lifetime_seconds
  tunnel1_rekey_fuzz_percentage        = each.value.tunnel1_rekey_fuzz_percentage
  tunnel2_rekey_fuzz_percentage        = each.value.tunnel2_rekey_fuzz_percentage
  tunnel1_rekey_margin_time_seconds    = each.value.tunnel1_rekey_margin_time_seconds
  tunnel2_rekey_margin_time_seconds    = each.value.tunnel2_rekey_margin_time_seconds
  tunnel1_replay_window_size           = each.value.tunnel1_replay_window_size
  tunnel2_replay_window_size           = each.value.tunnel2_replay_window_size
  tunnel1_startup_action               = each.value.tunnel1_startup_action
  tunnel2_startup_action               = each.value.tunnel2_startup_action
}
