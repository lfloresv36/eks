variable "addon_context" {
  description = "Addon context that can be passed directly to blueprints addon modules"
  type        = any
}
# tflint-ignore: terraform_unused_declarations
variable "resources_precreated" {
  description = "Have expensive resources been created already"
  type        = bool
}

variable "load_balancer_controller_chart_version" {
  description = "The chart version of aws-load-balancer-controller to use"
  type        = string
  # renovate-helm: depName=aws-load-balancer-controller
  default = "1.8.2"
}
