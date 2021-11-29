aws_region = "ap-east-1"

vpcs = {
  dev-cicd = {
    cidr_block                       = "172.31.0.0/16"
    instance_tenancy                 = null
    enable_dns_support               = true
    enable_dns_hostnames             = true
    assign_generated_ipv6_cidr_block = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd"
    }
  }
}

subnets = {
  dev-cicd-static-public-a = {
    vpc_id_ref                      = "dev-cicd"
    availability_zone               = "a"
    cidr_block                      = "172.31.48.0/20"
    ipv6_cidr_block                 = null
    map_public_ip_on_launch         = true
    assign_ipv6_address_on_creation = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd-static-public-a"
    }
  }
  dev-cicd-static-private-a = {
    vpc_id_ref                      = "dev-cicd"
    availability_zone               = "a"
    cidr_block                      = "172.31.16.0/20"
    ipv6_cidr_block                 = null
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd-static-private-a"
    }
  }  
  dev-cicd-static-private-b = {
    vpc_id_ref                      = "dev-cicd"
    availability_zone               = "b"
    cidr_block                      = "172.31.0.0/20"
    ipv6_cidr_block                 = null
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd-static-private-b"
    }
  }
  dev-cicd-static-private-c = {
    vpc_id_ref                      = "dev-cicd"
    availability_zone               = "c"
    cidr_block                      = "172.31.32.0/20"
    ipv6_cidr_block                 = null
    map_public_ip_on_launch         = false
    assign_ipv6_address_on_creation = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd-static-private-c"
    }
  }
}

tls_private_keys = {
  dev-cicd-key = {
    algorithm   = "RSA"
    rsa_bits    = "4096"
    ecdsa_curve = null
  }
}

key_pairs = {
  dev-cicd-key = {
    public_key_ref = "dev-cicd-key"
    tags = {
      environment = "dev"
      Name        = "dev-cicd-key"
    }
  }
}

data_kms_keys = {
  cdra = {
    key_id = "d1ef54c5-6174-4d32-8c1f-c56ab3fd2863"
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
  dev-cicd-ansible-01 = {
    associate_with_private_ip = null
    instance_ref              = null
    network_interface_ref     = null
    vpc                       = true
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ansible-01"
    }
  }
  dev-cicd-jenkins-server-01 = {
    associate_with_private_ip = null
    instance_ref              = null
    network_interface_ref     = null
    vpc                       = true
    tags = {
      environment = "dev"
      Name        = "dev-cicd-jenkins-server-01"
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
  dev-cicd-ansible-01 = {
    allocation_id_ref        = "dev-cicd-ansible-01"
    allow_reassociation      = true
    instance_id_ref          = null
    network_interface_id_ref = "dev-cicd-ansible-01"
    private_ip_address       = null
  }
  dev-cicd-jenkins-server-01 = {
    allocation_id_ref        = "dev-cicd-jenkins-server-01"
    allow_reassociation      = true
    instance_id_ref          = null
    network_interface_id_ref = "dev-cicd-jenkins-server-01"
    private_ip_address       = null
  }
}

network_interfaces = {
  dev-cicd-ghe-01 = {
    subnet_id_ref        = "dev-cicd-ghe-01"
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
  dev-cicd-ansible-01 = {
    subnet_id_ref        = "dev-cicd-ansible-01"
    description          = "Managed by Terraform"
    private_ips          = ["172.31.48.10"]
    ipv6_addresses       = null
    security_groups_refs = ["dev-cicd-smg-linux", "dev-cicd-ansible"]
    source_dest_check    = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ansible-01"
    }
  }
  dev-cicd-jenkins-server-01 = {
    subnet_id_ref        = "dev-cicd-jenkins-server-01"
    description          = "Managed by Terraform"
    private_ips          = ["172.31.48.12"]
    ipv6_addresses       = null
    security_groups_refs = ["dev-cicd-smg-linux", "dev-cicd-jenkins-server"]
    source_dest_check    = false
    tags = {
      environment = "dev"
      Name        = "dev-cicd-jenkins-server-01"
    }
  }
}

security_groups = {
  dev-cicd-smg-linux = {
    description = "Managed by Terraform"
    vpc_id_ref  = "dev-cicd"
    tags = {
      environment = "dev"
      Name        = "dev-cicd-smg-linux"
    }
  }
  dev-cicd-ghe = {
    description = "Managed by Terraform"
    vpc_id_ref  = "dev-cicd"
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ghe"
    }
  }
  dev-cicd-ansible = {
    description = "Managed by Terraform"
    vpc_id_ref  = "dev-cicd"
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ansible"
    }
  }
  dev-cicd-jenkins-server = {
    description = "Managed by Terraform"
    vpc_id_ref  = "dev-cicd"
    tags = {
      environment = "dev"
      Name        = "dev-cicd-jenkins-server"
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
  dev-cicd-ansible-egress-any = {
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
  dev-cicd-ansible-ingress-ssh = {
    security_group_id_ref        = "dev-cicd-ansible"
    description                  = "Managed by Terraform"
    type                         = "ingress"
    protocol                     = "tcp"
    from_port                    = 22
    to_port                      = 22
    cidr_blocks                  = ["183.178.2.84/32","203.218.6.213/32","61.93.230.193/32","172.31.0.0/16"]
    ipv6_cidr_blocks             = []
    source_security_group_id_ref = null
    self                         = false
  }
  dev-cicd-ansible-egress-any = {
    security_group_id_ref        = "dev-cicd-ansible"
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
  dev-cicd-jenkins-server-ingress-https = {
    security_group_id_ref        = "dev-cicd-jenkins-server"
    description                  = "Managed by Terraform"
    type                         = "ingress"
    protocol                     = "tcp"
    from_port                    = 8080
    to_port                      = 8080
    cidr_blocks                  = ["0.0.0.0/0"]
    ipv6_cidr_blocks             = []
    source_security_group_id_ref = null
    self                         = false
  }
  dev-cicd-jenkins-server-ingress-any = {
    security_group_id_ref        = "dev-cicd-jenkins-server"
    description                  = "Managed by Terraform"
    type                         = "ingress"
    protocol                     = "-1"
    from_port                    = 0
    to_port                      = 0
    cidr_blocks                  = ["172.31.0.0/16"]
    ipv6_cidr_blocks             = []
    source_security_group_id_ref = null
    self                         = false
  }
  dev-cicd-jenkins-server-egress-any = {
    security_group_id_ref        = "dev-cicd-jenkins-server"
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
        encrypted             = false
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
    key_name_ref                         = "dev-cicd-key"
    monitoring                           = false
    network_interface_id_ref             = "dev-cicd-ghe-01"
    root_block_device = {
      delete_on_termination = true
      encrypted             = false
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

  dev-cicd-ansible-01 = {
    ami               = "ami-05892ab682f8ff858" # Amazon Linux 2 AMI
    availability_zone = "a"
    credit_specification = {
      cpu_credits = null
    }
    disable_api_termination = false
    ebs_block_device = {}
    ebs_optimized                        = false
    hibernation                          = false
    iam_instance_profile_ref             = null
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "t3.medium"
    key_name_ref                         = "dev-cicd-key"
    monitoring                           = false
    network_interface_id_ref             = "dev-cicd-ansible-01"
    root_block_device = {
      delete_on_termination = true
      encrypted             = false
      iops                  = null
      kms_key_id_ref        = null
      tags = {
        environment = "dev"
        Name        = "dev-cicd-ansible-01"
      }
      throughput  = null
      volume_size = 50
      volume_type = "gp2"
    }
    tags = {
      environment = "dev"
      Name        = "dev-cicd-ansible-01"
    }
    user_data_ref = null
  }

  dev-cicd-jenkins-server-01 = {
    ami               = "ami-05892ab682f8ff858" # Amazon Linux 2 AMI
    availability_zone = "a"
    credit_specification = {
      cpu_credits = null
    }
    disable_api_termination = false
    ebs_block_device = {}
    ebs_optimized                        = false
    hibernation                          = false
    iam_instance_profile_ref             = null
    instance_initiated_shutdown_behavior = "stop"
    instance_type                        = "t3.small"
    key_name_ref                         = "dev-cicd-key"
    monitoring                           = false
    network_interface_id_ref             = "dev-cicd-jenkins-server-01"
    root_block_device = {
      delete_on_termination = true
      encrypted             = false
      iops                  = null
      kms_key_id_ref        = null
      tags = {
        environment = "dev"
        Name        = "dev-cicd-jenkins-server-01"
      }
      throughput  = null
      volume_size = 50
      volume_type = "gp2"
    }
    tags = {
      environment = "dev"
      Name        = "dev-cicd-jenkins-server-01"
    }
    user_data_ref = null
  }
}