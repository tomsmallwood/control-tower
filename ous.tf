data "aws_organizations_organizational_units" "root" {
  parent_id = aws_organizations_organization.org.roots[0].id
}
# Provisioned by AWS Control Tower
# resource "aws_organizations_organizational_unit" "security" {
#   name      = "Security"
#   parent_id = data.aws_organizations_organizational_units.root.id
# }
resource "aws_organizations_organizational_unit" "aft_management" {
  name      = "AFT-Management"
  parent_id = data.aws_organizations_organizational_units.root.id
}
