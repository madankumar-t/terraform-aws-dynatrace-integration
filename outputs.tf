output "role_arn" {
  value       = aws_iam_role.dynatrace_integration_role.arn
  description = "ARN of the IAM role"
}

output "aws_account_id" {
  value       = var.account_id
  description = "AWS account ID used in the trust relationship"
}
