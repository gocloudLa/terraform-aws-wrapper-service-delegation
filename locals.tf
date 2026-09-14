locals {
  enable       = try(var.service_delegation_parameters.enable, var.service_delegation_defaults.enable, true)
  cloudtrail   = try(var.service_delegation_parameters.cloudtrail, var.service_delegation_defaults.cloudtrail, null)
  guardduty    = try(var.service_delegation_parameters.guardduty, var.service_delegation_defaults.guardduty, null)
  security_hub = try(var.service_delegation_parameters.security_hub, var.service_delegation_defaults.security_hub, null)
}
