provider "aws" {
  region              = var.ct_home_region
  profile             = var.admin_profile
  allowed_account_ids = var.allowed_account_ids
}
