aws_region = "ap-east-1"

# vpcs = {
#   dev-cicd = {
#     cidr_block                       = "172.31.0.0/16"
#     instance_tenancy                 = null
#     enable_dns_support               = true
#     enable_dns_hostnames             = true
#     assign_generated_ipv6_cidr_block = false
#     tags = {
#       environment = "dev"
#       Name        = "dev-cicd"
#     }
#   }
# }
data_vpcs = {
  dev-cicd = {
    cidr_block = "172.31.0.0/16"
  }
}

data_subnets = {
  dev-cicd-static-public-a = {
    availability_zone = "a"
    cidr_block        = "172.31.48.0/20"
  }
  dev-cicd-static-private-b = {
    availability_zone = "b"
    cidr_block        = "172.31.0.0/20"
  }
}

data_security_groups = {
  dev-cicd-smg-linux = {
    vpc_id_ref = "dev-cicd"
    name       = "dev-cicd-smg-linux"
  }
  # dev-cicd-ghe = {
  #   vpc_id_ref = "dev-cicd"
  #   name       = "dev-cicd-ghe"
  # }

}
data_kms_keys = {
  cdra = {
    key_id = "d1ef54c5-6174-4d32-8c1f-c56ab3fd2863"
  }
}

tls_private_keys = {
  dev-ghe-key = {
    algorithm   = "RSA"
    rsa_bits    = "4096"
    ecdsa_curve = null
  }
}

key_pairs = {
  dev-ghe-key = {
    public_key_ref = "dev-ghe-key"
    tags = {
      environment = "dev"
      Name        = "dev-ghe-key"
    }
  }
}

eips = {
  dev-cicd-ghe-01 = {
    associate_with_private_ip = null
    instance_ref              = null
    network_interface_ref     = null
    vpc                       = true
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe-01"
    }
  }
  dev-cicd-ghe-02 = {
    associate_with_private_ip = null
    instance_ref              = null
    network_interface_ref     = null
    vpc                       = true
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe-02"
    }
  }
}

eip_associations = {
  dev-cicd-ghe-01 = {
    allocation_id_ref        = "dev-cicd-ghe-01"
    allow_reassociation      = true
    instance_id_ref          = null
    network_interface_id_ref = "dev-cicd-ghe-01"
    private_ip_address       = null
  }
  dev-cicd-ghe-02 = {
    allocation_id_ref        = "dev-cicd-ghe-02"
    allow_reassociation      = true
    instance_id_ref          = null
    network_interface_id_ref = "dev-cicd-ghe-02"
    private_ip_address       = null
  }
}

network_interfaces = {
  dev-cicd-ghe-01 = {
    subnet_id_ref        = "dev-cicd-static-public-a"
    description          = "Managed by Terraform"
    private_ips          = ["172.31.48.11"]
    ipv6_addresses       = null
    security_groups_refs = ["dev-cicd-smg-linux", "dev-cicd-ghe"]
    source_dest_check    = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe-01"
    }
  }
  dev-cicd-ghe-02 = {
    subnet_id_ref        = "dev-cicd-static-public-a"
    description          = "Managed by Terraform"
    private_ips          = ["172.31.48.21"]
    ipv6_addresses       = null
    security_groups_refs = ["dev-cicd-smg-linux", "dev-cicd-ghe"]
    source_dest_check    = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe-02"
    }
  }
  dev-cicd-ghe-backup = {
    subnet_id_ref        = "dev-cicd-static-private-b"
    description          = "Managed by Terraform"
    private_ips          = ["172.31.0.11"]
    ipv6_addresses       = null
    security_groups_refs = ["dev-cicd-smg-linux", "dev-cicd-ghe-backup"]
    source_dest_check    = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe-backup"
    }
  }
}

network_interface_attachments = {
  dev-cicd-ghe-backup = {
    instance_id_ref          = "dev-cicd-ghe-backup"
    network_interface_id_ref = "dev-cicd-ghe-backup"
    device_index             = 1
  }
}
security_groups = {
  dev-cicd-ghe = {
    description = "Managed by Terraform"
    vpc_id_ref  = "dev-cicd"
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe"
    }
  }
  dev-cicd-ghe-backup = {
    description = "Managed by Terraform"
    vpc_id_ref  = "dev-cicd"
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe-backup"
    }
  }
}

security_group_rules = {
  dev-cicd-ghe-ingress-8443 = {
    security_group_id_ref        = "dev-cicd-ghe"
    description                  = "Managed by Terraform"
    type                         = "ingress"
    protocol                     = "tcp"
    from_port                    = 8443
    to_port                      = 8443
    cidr_blocks                  = ["0.0.0.0/0"]
    ipv6_cidr_blocks             = []
    source_security_group_id_ref = null
    self                         = false
  }
  dev-cicd-ghe-ingress-https = {
    security_group_id_ref        = "dev-cicd-ghe"
    description                  = "Managed by Terraform"
    type                         = "ingress"
    protocol                     = "tcp"
    from_port                    = 443
    to_port                      = 443
    cidr_blocks                  = ["0.0.0.0/0"]
    ipv6_cidr_blocks             = []
    source_security_group_id_ref = null
    self                         = false
  }
  dev-cicd-ghe-ingress-any = {
    security_group_id_ref        = "dev-cicd-ghe"
    description                  = "Managed by Terraform"
    type                         = "ingress"
    protocol                     = "-1"
    from_port                    = 0
    to_port                      = 0
    cidr_blocks                  = ["172.31.0.0/16", "192.168.20.0/24", "183.178.2.84/32"]
    ipv6_cidr_blocks             = []
    source_security_group_id_ref = null
    self                         = false
  }
  dev-cicd-ghe-egress-any = {
    security_group_id_ref        = "dev-cicd-ghe"
    description                  = "Managed by Terraform"
    type                         = "egress"
    protocol                     = "-1"
    from_port                    = 0
    to_port                      = 0
    cidr_blocks                  = ["0.0.0.0/0"]
    ipv6_cidr_blocks             = []
    source_security_group_id_ref = null
    self                         = false
  }
  dev-cicd-ghe-backup-ingress-any = {
    security_group_id_ref        = "dev-cicd-ghe-backup"
    description                  = "Managed by Terraform"
    type                         = "ingress"
    protocol                     = "-1"
    from_port                    = 0
    to_port                      = 0
    cidr_blocks                  = ["172.31.16.0/20","172.31.48.0/20"]
    ipv6_cidr_blocks             = []
    source_security_group_id_ref = null
    self                         = false
  }
  dev-cicd-ghe-backup-egress-any = {
    security_group_id_ref        = "dev-cicd-ghe-backup"
    description                  = "Managed by Terraform"
    type                         = "egress"
    protocol                     = "-1"
    from_port                    = 0
    to_port                      = 0
    cidr_blocks                  = ["0.0.0.0/0"]
    ipv6_cidr_blocks             = []
    source_security_group_id_ref = null
    self                         = false
  }

}
  

instances = {
  dev-cicd-ghe-01 = {
    ami               = "ami-0cf178ebed099cc93" # latest GitHub Enterprise Server 3.3.0.rc1
    availability_zone = "a"
    credit_specification = {
      cpu_credits = null
    }
    disable_api_termination = false
    ebs_block_device = {
      sdb = {
        delete_on_termination = true
        device_name           = "/dev/sdb"
        encrypted             = true
        iops                  = null
        snapshot_id           = null
        tags = {
          environment = "dev"
          Name        = "dev-cicd-ghe-01"
        }
        throughput            = null
        volume_size           = 1000
        volume_type           = "gp2"
		    kms_key_id_ref        = "cdra"
      }
    }
    ebs_optimized                        = false
    hibernation                          = false
    iam_instance_profile_ref             = null
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "r5.2xlarge"
    key_name_ref                         = "dev-ghe-key"
    monitoring                           = false
    network_interface_id_ref             = "dev-cicd-ghe-01"
    root_block_device = {
      delete_on_termination = true
      encrypted             = true
      iops                  = null
      kms_key_id_ref        = "cdra"
      tags = {
        environment = "dev"
        Name        = "dev-cicd-ghe-01"
      }
      throughput  = null
      volume_size = 200
      volume_type = "gp2"
    }
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe-01"
    }
    user_data_ref = null
  }
  dev-cicd-ghe-02 = {
    ami               = "ami-0cf178ebed099cc93" # latest GitHub Enterprise Server 3.3.0.rc1
    availability_zone = "a"
    credit_specification = {
      cpu_credits = null
    }
    disable_api_termination = false
    ebs_block_device = {
      sdb = {
        delete_on_termination = true
        device_name           = "/dev/sdb"
        encrypted             = true
        iops                  = null
        snapshot_id           = null
        tags = {
          environment = "dev"
          Name        = "dev-cicd-ghe-02"
        }
        throughput            = null
        volume_size           = 1000
        volume_type           = "gp2"
		    kms_key_id_ref        = "cdra"
      }
    }
    ebs_optimized                        = false
    hibernation                          = false
    iam_instance_profile_ref             = null
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "r5.xlarge"
    key_name_ref                         = "dev-ghe-key"
    monitoring                           = false
    network_interface_id_ref             = "dev-cicd-ghe-02"
    root_block_device = {
      delete_on_termination = true
      encrypted             = true
      iops                  = null
      kms_key_id_ref        = "cdra"
      tags = {
        environment = "dev"
        Name        = "dev-cicd-ghe-02"
      }
      throughput  = null
      volume_size = 200
      volume_type = "gp2"
    }
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe-02"
    }
    user_data_ref = null
  }
  dev-cicd-ghe-backup = {
    ami               = "ami-010eef29fc1fb56b0" # Amazon Linux 2 AMI (HVM) - Kernel 4.14
    availability_zone = "b"
    credit_specification = {
      cpu_credits = null
    }
    disable_api_termination = false
    ebs_block_device = {
      sdb = {
        delete_on_termination = true
        device_name           = "/dev/sdb"
        encrypted             = true
        iops                  = null
        snapshot_id           = null
        tags = {
          environment = "dev"
          Name        = "dev-cicd-ghe-backup"
        }
        throughput            = null
        volume_size           = 2000
        volume_type           = "gp2"
		    kms_key_id_ref        = "cdra"
      }
    }
    ebs_optimized                        = false
    hibernation                          = false
    iam_instance_profile_ref             = null
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "t2.medium"
    key_name_ref                         = "dev-ghe-key"
    monitoring                           = false
    network_interface_id_ref             = "dev-cicd-ghe-backup"
    root_block_device = {
      delete_on_termination = true
      encrypted             = true
      iops                  = null
      kms_key_id_ref        = "cdra"
      tags = {
        environment = "dev"
        Name        = "dev-cicd-ghe-backup"
      }
      throughput  = null
      volume_size = 50
      volume_type = "gp2"
    }
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe-backup"
    }
    user_data_ref = null
  }
}