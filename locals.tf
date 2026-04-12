locals {
  enable       = lookup(var.service_delegation_parameters, "enable", true)
  cloudtrail   = try(var.service_delegation_parameters.cloudtrail, null)
  guardduty    = try(var.service_delegation_parameters.guardduty, null)
  security_hub = try(var.service_delegation_parameters.security_hub, null)
}
