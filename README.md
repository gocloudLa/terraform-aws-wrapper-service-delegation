# Standard Platform - Terraform Module 🚀🚀
<p align="right"><a href="https://partners.amazonaws.com/partners/0018a00001hHve4AAC/GoCloud"><img src="https://img.shields.io/badge/AWS%20Partner-Advanced-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Partner"/></a><a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-green?style=for-the-badge&logo=apache&logoColor=white" alt="LICENSE"/></a></p>

Welcome to the Standard Platform — a suite of reusable and production-ready Terraform modules purpose-built for AWS environments.
Each module encapsulates best practices, security configurations, and sensible defaults to simplify and standardize infrastructure provisioning across projects.

## 📦 Module: Terraform AWS Service Delegation Module
<p align="right"><a href="https://github.com/gocloudLa/terraform-aws-wrapper-service-delegation/releases/latest"><img src="https://img.shields.io/github/v/release/gocloudLa/terraform-aws-wrapper-service-delegation.svg?style=for-the-badge" alt="Latest Release"/></a><a href=""><img src="https://img.shields.io/github/last-commit/gocloudLa/terraform-aws-wrapper-service-delegation.svg?style=for-the-badge" alt="Last Commit"/></a><a href="https://registry.terraform.io/modules/gocloudLa/wrapper-service-delegation/aws"><img src="https://img.shields.io/badge/Terraform-Registry-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Registry"/></a></p>
The Terraform wrapper for AWS service delegation simplifies registering delegated administrator and organization-administrator accounts for CloudTrail, GuardDuty, and Security Hub from your AWS Organizations management account. This wrapper is a small, opinionated template so you do not have to wire those provider resources yourself. Supply settings through the `service_delegation_parameters` map (see `input_table`). It follows the same GoCloud `metadata` convention as other wrappers even though it does not apply tags to AWS resources.

### ✨ Features




## 🚀 Quick Start
```hcl
module "service_delegation" {
  source = "gocloudLa/wrapper-service-delegation/aws"

  metadata = local.metadata

  service_delegation_parameters = {
    cloudtrail   = "123456789012"
    guardduty    = "123456789012"
    security_hub = "123456789012"
  }
}
```


## 🔧 Additional Features Usage



## 📑 Inputs
| Name         | Description                                                                                     | Type     | Default | Required |
| ------------ | ----------------------------------------------------------------------------------------------- | -------- | ------- | -------- |
| enable       | When true, creates delegation resources for any supplied account ids; when false, creates none. | `bool`   | `true`  | no       |
| cloudtrail   | Member account id to register as CloudTrail organization delegated administrator.               | `string` | `null`  | no       |
| guardduty    | Member account id to designate as GuardDuty organization administrator.                         | `string` | `null`  | no       |
| security_hub | Member account id to designate as Security Hub organization administrator.                      | `string` | `null`  | no       |







## ⚠️ Important Notes
- **Management account:** Run with credentials for the AWS Organizations management account and IAM permissions that allow the underlying APIs.
- **enable:** Defaults to **true** when omitted; set `enable = false` to create no delegation resources. Each of `cloudtrail`, `guardduty`, and `security_hub` is optional—omit or set `null` to skip that registration.
- **Region:** GuardDuty and Security Hub registrations are evaluated in the configured AWS provider region.
- **Scope:** Other services (for example Config or IAM Identity Center) are not handled here; use `aws_organizations_delegated_administrator` or other modules as needed.



---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 