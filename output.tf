output "enabled" {
  description = "Whether service_delegation_parameters.enable allows resources to be created (lookup default true)."
  value       = local.enable
}

output "cloudtrail_delegated_administrator_arn" {
  value = try(aws_cloudtrail_organization_delegated_admin_account.this[0].arn, null)
}

output "guardduty_admin_account_id" {
  value = try(aws_guardduty_organization_admin_account.this[0].admin_account_id, null)
}

output "securityhub_admin_account_id" {
  value = try(aws_securityhub_organization_admin_account.this[0].admin_account_id, null)
}
