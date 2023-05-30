# default AWS region
variable "region" {
  type    = string
  default = "us-east-1"
}

# AWS profile used to bootstrap the AWS Organization for Control Tower
variable "admin_profile" {
  type = string
}

# list of allowed AWS account IDs to prevent you from mistakenly using an incorrect one
variable "allowed_account_ids" {
  type = list(string)
}
