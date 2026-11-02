resource "aws_cloudtrail_organization_delegated_admin_account" "this" {
  count = local.enable && local.cloudtrail != null ? 1 : 0

  account_id = local.cloudtrail
}

resource "aws_guardduty_organization_admin_account" "this" {
  count = local.enable && local.guardduty != null ? 1 : 0

  admin_account_id = local.guardduty
}

# Key: AWS Region (guardduty_regions minus the provider Region)
resource "aws_guardduty_organization_admin_account" "additional" {
  for_each = local.guardduty_additional_regions

  region           = each.value
  admin_account_id = local.guardduty
}

resource "aws_securityhub_organization_admin_account" "this" {
  count = local.enable && local.security_hub != null ? 1 : 0

  admin_account_id = local.security_hub
}

# Key: service principal (config.amazonaws.com | config-multiaccountsetup.amazonaws.com)
resource "aws_organizations_delegated_administrator" "config" {
  for_each = local.config_service_principals

  account_id        = local.config
  service_principal = each.value
}

resource "aws_organizations_delegated_administrator" "backup" {
  count = local.enable && local.backup != null ? 1 : 0

  account_id        = local.backup
  service_principal = "backup.amazonaws.com"
}

resource "aws_organizations_delegated_administrator" "stacksets" {
  count = local.enable && local.stacksets != null ? 1 : 0

  account_id        = local.stacksets
  service_principal = "member.org.stacksets.cloudformation.amazonaws.com"
}

data "aws_iam_policy_document" "backup_policy_delegation" {
  count = local.backup_policy_delegation ? 1 : 0

  statement {
    sid    = "DelegatingNecessaryDescribeListActions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${local.backup}:root"]
    }
    actions = [
      "organizations:DescribeOrganization",
      "organizations:DescribeOrganizationalUnit",
      "organizations:DescribeAccount",
      "organizations:ListRoots",
      "organizations:ListOrganizationalUnitsForParent",
      "organizations:ListParents",
      "organizations:ListChildren",
      "organizations:ListAccounts",
      "organizations:ListAccountsForParent",
      "organizations:ListTagsForResource",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "DelegatingNecessaryDescribeListActionsForSpecificPolicyType"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${local.backup}:root"]
    }
    actions = [
      "organizations:DescribePolicy",
      "organizations:DescribeEffectivePolicy",
      "organizations:ListPolicies",
      "organizations:ListPoliciesForTarget",
      "organizations:ListTargetsForPolicy",
    ]
    resources = ["*"]
    condition {
      test     = "StringLikeIfExists"
      variable = "organizations:PolicyType"
      values   = ["BACKUP_POLICY"]
    }
  }

  statement {
    sid    = "DelegatingAllActionsForBackupPolicies"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${local.backup}:root"]
    }
    actions = [
      "organizations:CreatePolicy",
      "organizations:UpdatePolicy",
      "organizations:DeletePolicy",
      "organizations:AttachPolicy",
      "organizations:DetachPolicy",
      "organizations:EnablePolicyType",
      "organizations:DisablePolicyType",
      "organizations:TagResource",
      "organizations:UntagResource",
    ]
    resources = [
      "arn:${data.aws_partition.current.partition}:organizations::${data.aws_organizations_organization.this[0].master_account_id}:root/${data.aws_organizations_organization.this[0].id}/${data.aws_organizations_organization.this[0].roots[0].id}",
      "arn:${data.aws_partition.current.partition}:organizations::${data.aws_organizations_organization.this[0].master_account_id}:ou/${data.aws_organizations_organization.this[0].id}/*",
      "arn:${data.aws_partition.current.partition}:organizations::${data.aws_organizations_organization.this[0].master_account_id}:account/${data.aws_organizations_organization.this[0].id}/*",
      "arn:${data.aws_partition.current.partition}:organizations::${data.aws_organizations_organization.this[0].master_account_id}:policy/${data.aws_organizations_organization.this[0].id}/backup_policy/*",
    ]
    condition {
      test     = "StringLikeIfExists"
      variable = "organizations:PolicyType"
      values   = ["BACKUP_POLICY"]
    }
  }
}

resource "aws_organizations_resource_policy" "backup" {
  count = local.backup_policy_delegation ? 1 : 0

  content = data.aws_iam_policy_document.backup_policy_delegation[0].json
}
