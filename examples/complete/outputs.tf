output "cloudtrail_delegated_administrator_arn" {
  value = module.wrapper_service_delegation.cloudtrail_delegated_administrator_arn
}

output "guardduty_admin_account_id" {
  value = module.wrapper_service_delegation.guardduty_admin_account_id
}

output "securityhub_admin_account_id" {
  value = module.wrapper_service_delegation.securityhub_admin_account_id
}
