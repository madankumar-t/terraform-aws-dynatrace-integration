# terraform-aws-dynatrace-integration

Terraform module to provision IAM policy and role for Dynatrace AWS integration.

## Usage

```hcl
provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

module "dynatrace_integration" {
  source      = "./terraform-aws-dynatrace-integration"
  aws_region  = "us-east-1"
  external_id = "bf293182-1d1d-41e5-80e6-63d1195d1da2"
  account_id  = data.aws_caller_identity.current.account_id
}
```

## Inputs

| Name             | Description                                   | Type   | Default     |
|------------------|-----------------------------------------------|--------|-------------|
| `aws_region`     | AWS region to deploy resources                | string | "us-east-1" |
| `external_id`    | External ID for Dynatrace                     | string | n/a         |
| `account_id`     | AWS Account ID to trust (dynamic or static)   | string | n/a         |

## Outputs

| Name            | Description                         |
|-----------------|-------------------------------------|
| `role_arn`      | IAM Role ARN                        |
| `aws_account_id`| AWS Account ID used in trust policy |
