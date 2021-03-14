locals {
    tags = {
        owner = "platform"
        created_by = "terratest"
    }
}

module "ecs_alb" {
    source = "../../../modules/alb"

    vpc_id = "vpc-0e0a5b651526844b5"
    subnets = ["subnet-0fc01567a7161734a","subnet-0e663e0ca71c6d79d"]
    https_certificate_domain = "refsdc.eftours.io"
    enable_deletion_protection = false

    alb_name = var.alb_name
    is_internal = var.is_internal
    is_port_80_redirect_enabled = var.is_port_80_redirect_enabled

    tags = local.tags
}

data "aws_lb" "ecs_alb" {
    arn = module.ecs_alb.alb_arn
}

### This & disabling port 80 redirect is needed to get around the fact that we have no valid SSL certs in Sandbox2 to use
resource "aws_lb_listener" "http" {
  load_balancer_arn = data.aws_lb.ecs_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Success"
      status_code  = "200"
    }
  }
}
