output "cloudtrail_delegated_administrator_arn" {
  value = try(aws_cloudtrail_organization_delegated_admin_account.this[0].arn, null)
}

output "guardduty_admin_account_id" {
  value = try(aws_guardduty_organization_admin_account.this[0].admin_account_id, null)
}

output "guardduty_delegated_regions" {
  value = concat(
    length(aws_guardduty_organization_admin_account.this) > 0 ? [data.aws_region.current.region] : [],
    sort(keys(aws_guardduty_organization_admin_account.additional)),
  )
}

output "securityhub_admin_account_id" {
  value = try(aws_securityhub_organization_admin_account.this[0].admin_account_id, null)
}

output "config_delegated_service_principals" {
  value = keys(aws_organizations_delegated_administrator.config)
}

output "backup_delegated_administrator_account_id" {
  value = try(aws_organizations_delegated_administrator.backup[0].account_id, null)
}

output "stacksets_delegated_administrator_account_id" {
  value = try(aws_organizations_delegated_administrator.stacksets[0].account_id, null)
}

output "organization_resource_policy_id" {
  value = try(aws_organizations_resource_policy.backup[0].id, null)
}
