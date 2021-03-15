locals {
    tags = {
        owner = "platform"
        created_by = "terratest"
    }
    cluster_name = "test-cluster"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = local.cluster_name

  tags = local.tags
  
  capacity_providers = [
    "FARGATE",
    "FARGATE_SPOT"
  ]
}