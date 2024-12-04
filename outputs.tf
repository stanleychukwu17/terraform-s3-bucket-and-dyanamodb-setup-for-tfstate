output "s3_bucket_name" {
  # This is the name of the S3 bucket. It’s one of the most commonly needed outputs, especially if the bucket is used to store Terraform state files or other critical data.
  value = aws_s3_bucket.tfstate.bucket
}

output "s3_bucket_id" {
  # The unique ID for the S3 bucket, which is useful if you need to reference the bucket programmatically or in other parts of your infrastructure.
  value = aws_s3_bucket.tfstate.id
}

output "s3_bucket_domain_name" {
  # This is the domain name of the S3 bucket, which is useful if you're going to use the bucket as a static website or reference it externally.
  value = aws_s3_bucket.tfstate.bucket_domain_name
}



output "dynamodb_table_name" {
  # The name of the table, which is "tfstate-lock"
  value = aws_dynamodb_table.tfstate_lock.name
}

output "dynamodb_table_id" {
  # The unique ID of the DynamoDB table. This can be useful for tracking or logging purposes.
  value = aws_dynamodb_table.tfstate_lock.id
}