module "wrapper_service_delegation" {
  source = "../../"

  metadata = local.metadata

  service_delegation_parameters = {
    # enable = false  # Default: true
    cloudtrail   = "123456789012"
    guardduty    = "123456789012"
    security_hub = "123456789012"
  }
}
