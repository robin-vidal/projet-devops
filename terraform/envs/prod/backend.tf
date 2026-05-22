terraform {
  backend "s3" {
    bucket         = "gitea-forge-aws-terraform-state-prod"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile   = true
    encrypt        = true
  }
}
