provider "aws" {
  region              = var.region
  profile             = var.admin_profile
  allowed_account_ids = var.allowed_account_ids
}
