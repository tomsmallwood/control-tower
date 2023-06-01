data "aws_organizations_organizational_units" "root" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "aft_management" {
  name      = "AFT-Management"
  parent_id = data.aws_organizations_organizational_units.root.id
}

resource "aws_organizations_account" "aft" {
  name  = "AFT-Management"
  email = var.aft_management_account_email

  parent_id         = aws_organizations_organizational_unit.aft_management.id
  role_name         = "AWSControlTowerExecution"
  close_on_deletion = false
}

# Provisioned manually through AWS Control Tower:
# resource "aws_organizations_organizational_unit" "security" {
#   name      = "Security"
#   parent_id = data.aws_organizations_organizational_units.root.id
# }

# resource "aws_organizations_account" "logging" {
#   name  = "Logging"
#   email = "logging@finopsconsultant.com"

#   parent_id         = aws_organizations_organizational_unit.security.id
#   role_name         = "AWSControlTowerExecution"
#   close_on_deletion = false
# }

# resource "aws_organizations_account" "audit" {
#   name  = "Audit"
#   email = "audit@finopsconsultant.com"

#   parent_id         = aws_organizations_organizational_unit.security.id
#   role_name         = "AWSControlTowerExecution"
#   close_on_deletion = false
# }
