locals {
  enable       = try(var.service_delegation_parameters.enable, var.service_delegation_defaults.enable, true)
  cloudtrail   = try(var.service_delegation_parameters.cloudtrail, var.service_delegation_defaults.cloudtrail, null)
  guardduty    = try(var.service_delegation_parameters.guardduty, var.service_delegation_defaults.guardduty, null)
  security_hub = try(var.service_delegation_parameters.security_hub, var.service_delegation_defaults.security_hub, null)
  config       = try(var.service_delegation_parameters.config, var.service_delegation_defaults.config, null)

  backup    = try(var.service_delegation_parameters.backup, var.service_delegation_defaults.backup, null)
  stacksets = try(var.service_delegation_parameters.stacksets, var.service_delegation_defaults.stacksets, null)

  # Organizations resource policy delegating BACKUP_POLICY management to the backup account (one resource policy per organization).
  backup_policy_delegation = local.enable && local.backup != null && try(var.service_delegation_parameters.backup_policy_delegation, var.service_delegation_defaults.backup_policy_delegation, true)

  # GuardDuty delegation is Regional: the provider Region is managed by aws_guardduty_organization_admin_account.this,
  # any other Region listed in guardduty_regions by aws_guardduty_organization_admin_account.additional.
  guardduty_regions            = try(var.service_delegation_parameters.guardduty_regions, var.service_delegation_defaults.guardduty_regions, [])
  guardduty_additional_regions = local.enable && local.guardduty != null ? setsubtract(toset(local.guardduty_regions), [data.aws_region.current.region]) : toset([])

  # AWS Config needs two registrations: aggregator (config) and org rules / conformance packs (config-multiaccountsetup).
  config_service_principals = local.enable && local.config != null ? toset([
    "config.amazonaws.com",
    "config-multiaccountsetup.amazonaws.com",
  ]) : toset([])
}
