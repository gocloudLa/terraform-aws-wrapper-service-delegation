data "aws_region" "current" {}

data "aws_partition" "current" {}

data "aws_organizations_organization" "this" {
  count = local.backup_policy_delegation ? 1 : 0
}
