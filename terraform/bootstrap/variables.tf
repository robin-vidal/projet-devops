variable "state_bucket_dev" {
  description = "S3 bucket name for dev Terraform state"
  type        = string
  default     = "gitea-forge-aws-terraform-state-dev"
}

variable "state_bucket_prod" {
  description = "S3 bucket name for prod Terraform state"
  type        = string
  default     = "gitea-forge-aws-terraform-state-prod"
}
