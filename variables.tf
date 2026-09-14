/*----------------------------------------------------------------------*/
/* Common |                                                             */
/*----------------------------------------------------------------------*/

variable "metadata" {
  type = any
}

/*----------------------------------------------------------------------*/
/* Service Delegation | Variable Definition                             */
/*----------------------------------------------------------------------*/

variable "service_delegation_parameters" {
  type        = any
  description = "Account IDs to register as delegated administrators for CloudTrail, GuardDuty, and Security Hub."
  default     = {}
}

variable "service_delegation_defaults" {
  type        = any
  description = "Default values merged into each entry of service_delegation_parameters."
  default     = {}
}
