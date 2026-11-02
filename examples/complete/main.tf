module "wrapper_service_delegation" {
  source = "../../"

  metadata = local.metadata

  service_delegation_parameters = {
    # enable = false  # Default: true
    cloudtrail = "123456789012"
    guardduty  = "123456789012"
    # guardduty_regions = ["us-east-2", "us-east-1"] # Default: [] (provider Region only)
    security_hub = "123456789012"
    config       = "123456789012"
    backup       = "123456789012"
    stacksets    = "123456789012"
    # backup_policy_delegation = true # Default: true when backup is set (Organizations resource policy for BACKUP_POLICY)
  }
}
