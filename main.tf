resource "aws_cloudtrail_organization_delegated_admin_account" "this" {
  count = local.enable && local.cloudtrail != null ? 1 : 0

  account_id = local.cloudtrail
}

resource "aws_guardduty_organization_admin_account" "this" {
  count = local.enable && local.guardduty != null ? 1 : 0

  admin_account_id = local.guardduty
}

resource "aws_securityhub_organization_admin_account" "this" {
  count = local.enable && local.security_hub != null ? 1 : 0

  admin_account_id = local.security_hub
}
