output "cloudtrail_delegated_administrator_arn" {
  value = module.wrapper_service_delegation.cloudtrail_delegated_administrator_arn
}

output "guardduty_admin_account_id" {
  value = module.wrapper_service_delegation.guardduty_admin_account_id
}

output "securityhub_admin_account_id" {
  value = module.wrapper_service_delegation.securityhub_admin_account_id
}

output "config_delegated_service_principals" {
  value = module.wrapper_service_delegation.config_delegated_service_principals
}

output "guardduty_delegated_regions" {
  value = module.wrapper_service_delegation.guardduty_delegated_regions
}

output "backup_delegated_administrator_account_id" {
  value = module.wrapper_service_delegation.backup_delegated_administrator_account_id
}

output "stacksets_delegated_administrator_account_id" {
  value = module.wrapper_service_delegation.stacksets_delegated_administrator_account_id
}
