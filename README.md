# Control Tower
Deploys an AWS Organization using AWS Control Tower AFT (Account Factory for Terraform)

## Prerequisites

The following steps were  in [the AWS 'terraform-aws-control_tower_account_factory' repo](https://github.com/aws-ia/terraform-aws-control_tower_account_factory/tree/main#configure-and-launch-your-aws-control-tower-account-factory-for-terraform).

### 1. Setup AWS Management account
AWS Control Tower Requires a standalone AWS account in order to configure AWS Organizations/ Control Tower.

### 2. Create S3 Bucket for Terraform Backend
Instructions to manually create a secure AWS S3 bucket via AWS CLI, to be used as the first Terraform backend.

Set the profile & region to create the S3 bucket. E.g.:
```sh
export AWS_PROFILE=123_abc
export AWS_DEFAULT_REGION=us-east-1
```

Create S3 Bucket (object-lock enabled):
```sh
aws s3api create-bucket --bucket anuj-tfbackend --object-lock-enabled-for-bucket
```

***Since April 2023, S3 Public Access Block is enabled by default.***


## Deployment

```sh
terraform init -backend-config=./backends/finops.backend
```

## Terraform Docs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organization.anuj](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_profile"></a> [admin\_profile](#input\_admin\_profile) | AWS profile used to bootstrap the AWS Organization for Control Tower | `string` | n/a | yes |
| <a name="input_allowed_account_ids"></a> [allowed\_account\_ids](#input\_allowed\_account\_ids) | list of allowed AWS account IDs to prevent you from mistakenly using an incorrect one | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | default AWS region | `string` | `"us-east-1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
