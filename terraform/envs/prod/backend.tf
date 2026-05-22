terraform {
  backend "s3" {
    bucket         = "platform-terraform-state-prod"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "platform-terraform-locks"
    encrypt        = true
  }
}
