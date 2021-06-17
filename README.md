# terraform-aws-vanta
Terraform module to provide roles for [Vanta](https://www.vanta.com/) monitoring for an AWS account

## Usage

```hcl
module "vanta" {
  source             = "highwingio/vanta/aws"
  external_id = "<External ID provided by Vanta>"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.vanta_additional_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.vanta](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.vanta_additional_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.vanta_aws_auditor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.vanta_additional_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vanta_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_external_id"></a> [external\_id](#input\_external\_id) | External ID as provided by the Vanta UI | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vanta-auditor-arn"></a> [vanta-auditor-arn](#output\_vanta-auditor-arn) | The ARN from the Terraform-created role that you need to input into the Vanta UI at the end of the AWS connection steps. |
<!-- END_TF_DOCS -->

## Updating the README

This repo uses [terraform-docs](https://github.com/segmentio/terraform-docs) to autogenerate its README.

To regenerate, run this command:

```bash
$ terraform-docs .
```
