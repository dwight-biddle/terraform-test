locals {
    tags = {
        owner = "platform"
        created_by = "terratest"
    }
    cluster_name = "test-cluster"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name

  tags = var.tags
  
  capacity_providers = [
    "FARGATE",
    "FARGATE_SPOT"
  ]
}