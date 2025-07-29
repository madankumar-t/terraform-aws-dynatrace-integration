provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "dynatrace_monitoring_policy" {
  name        = "Dynatrace_monitoring_policy"
  description = "Dynatrace monitoring read-only policy"
  policy      = file("${path.module}/dynatrace-policy.json")
}

resource "aws_iam_role" "dynatrace_integration_role" {
  name = "DynatraceIntegrationRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:root"
        },
        Action = "sts:AssumeRole",
        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.external_id
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.dynatrace_integration_role.name
  policy_arn = aws_iam_policy.dynatrace_monitoring_policy.arn
}
