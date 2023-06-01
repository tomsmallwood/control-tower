# Control Tower home AWS region
variable "ct_home_region" {
  type    = string
  default = "us-east-1"
}

# Secondary region to replicate the AFT backend
variable "tf_backend_secondary_region" {
  type    = string
  default = "us-west-1"
}

# Account Factory for Terraform management account email address
variable "aft_management_account_email" {
  type = string
}

# AWS Control Tower Management account ID
variable "ct_management_account_id" {
  type = string
}

# Log Archive account ID
variable "log_archive_account_id" {
  type = string
}

# Auditing account ID
variable "audit_account_id" {
  type = string
}

# AWS profile used to bootstrap the AWS Organization for Control Tower
variable "admin_profile" {
  type = string
}

# list of allowed AWS account IDs to prevent you from mistakenly using an incorrect one
variable "allowed_account_ids" {
  type = list(string)
}
