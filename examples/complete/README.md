# Complete example 🚀

Root module wiring for terraform-aws-wrapper-service-delegation (metadata + inline service_delegation_parameters).

## 🔧 What's Included

### Analysis of Terraform Configuration

#### Main Purpose
Wire the wrapper from the AWS Organizations management account with placeholder member account IDs.

#### Key Features Demonstrated
- **metadata** — Defined in `metadata.tf` (same pattern as other examples).
- **service_delegation_parameters** — Inline map in `main.tf` (no merge in this example).
- **Provider** — Single `aws` in `providers.tf`; must use the Organizations management account.
- **enable** — Defaults to true in the module; set `enable = false` to create no delegation resources.

## 🚀 Quick Start

```bash
terraform init
terraform plan
terraform apply
```

## 🔒 Security Notes

⚠️ **Production Considerations**: 
- This example may include configurations that are not suitable for production environments
- Review and customize security settings, access controls, and resource configurations
- Ensure compliance with your organization's security policies
- Consider implementing proper monitoring, logging, and backup strategies

## 📖 Documentation

For detailed module documentation and additional examples, see the main [README.md](../../README.md) file. 