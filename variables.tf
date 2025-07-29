variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "external_id" {
  description = "External ID required by Dynatrace"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID to trust (fetched from caller identity)"
  type        = string
}
