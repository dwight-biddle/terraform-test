variable "alb_name" {
  default = "test-alb"
}

variable "is_internal" {
  default = false
}
variable "vpc_id" {
  default = "vpc-0e0a5b651526844b5"
}

variable "subnets_task" {
  default = ["subnet-0983aa439ccb86731", "subnet-02b4db59c437d4ffc"]
}

variable "subnets_alb" {
  default = ["subnet-0fc01567a7161734a","subnet-0e663e0ca71c6d79d"]
}

variable "is_port_80_redirect_enabled" {
  default = false
}
