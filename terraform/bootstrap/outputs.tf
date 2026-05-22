output "state_bucket_dev" {
  value = aws_s3_bucket.state_dev.bucket
}

output "state_bucket_prod" {
  value = aws_s3_bucket.state_prod.bucket
}
