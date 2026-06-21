module "eks" {

  source = "terraform-aws-modules/eks/aws"

  cluster_name = "ravinder-eks"

  cluster_version = "1.31"

  vpc_id = "vpc-0bf6156129c8fc592"

  subnet_ids = [
    "subnet-06d82a3e886c42930",
    "subnet-0f7431ee89ac2b19b"
  ]

  cluster_security_group_additional_rules = {
    ingress = {
      type                     = "ingress"
      protocol                 = "-1"
      from_port                = 0
      to_port                  = 0
      source_security_group_id = "sg-016b8014c069d78f5"
    }
  }

  eks_managed_node_groups = {
    dev = {
      desired_size = 2
      min_size     = 1
      max_size     = 2

      instance_types = ["t3.medium"]

      disk_size = 20
    }
  }

}
