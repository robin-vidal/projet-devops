terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  tags = {
    project    = "gitea-forge-aws"
    managed-by = "terraform"
  }
}

# S3 bucket for dev state

resource "aws_s3_bucket" "state_dev" {
  bucket        = var.state_bucket_dev
  force_destroy = true

  tags = merge(local.tags, { env = "dev" })
}

resource "aws_s3_bucket_versioning" "state_dev" {
  bucket = aws_s3_bucket.state_dev.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_dev" {
  bucket = aws_s3_bucket.state_dev.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "state_dev" {
  bucket                  = aws_s3_bucket.state_dev.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 bucket for prod state

resource "aws_s3_bucket" "state_prod" {
  bucket        = var.state_bucket_prod
  force_destroy = true

  tags = merge(local.tags, { env = "prod" })
}

resource "aws_s3_bucket_versioning" "state_prod" {
  bucket = aws_s3_bucket.state_prod.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_prod" {
  bucket = aws_s3_bucket.state_prod.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "state_prod" {
  bucket                  = aws_s3_bucket.state_prod.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
