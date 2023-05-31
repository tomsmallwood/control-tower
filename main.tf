resource "aws_organizations_organization" "org" {
  # aws_service_access_principals = [
  #   "cloudtrail.amazonaws.com"
  # ]
  feature_set = "ALL"
}

# deploy AFT
module "aft" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory?ref=1.10.3"

  # Required Vars
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = "444455556666"
  audit_account_id            = "123456789012"
  aft_management_account_id   = "777788889999"
  ct_home_region              = "us-east-1"
  tf_backend_secondary_region = "us-west-2"

  # VCS Vars
  vcs_provider                                  = "github"
  account_request_repo_name                     = "aws-ia/terraform-aws-control_tower_account_factory//sources/aft-customizations-repos/aft-account-request"
  global_customizations_repo_name               = "aws-ia/terraform-aws-control_tower_account_factory//sources/aft-customizations-repos/aft-global-customizations"
  account_customizations_repo_name              = "aws-ia/terraform-aws-control_tower_account_factory//sources/aft-customizations-repos/aft-account-customizations"
  account_provisioning_customizations_repo_name = "aws-ia/terraform-aws-control_tower_account_factory//sources/aft-customizations-repos/aft-account-provisioning-customizations"

  # Opt out of reporting metrics
  aft_metrics_reporting = false
}
