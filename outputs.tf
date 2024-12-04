output "s3_bucket_name" {
  # This is the name of the S3 bucket. It’s one of the most commonly needed outputs, especially if the bucket is used to store Terraform state files or other critical data.
  value = aws_s3_bucket.tfstate.bucket
}

output "s3_bucket_arn" {
  # The Amazon Resource Name (ARN) for the S3 bucket. This can be helpful when referencing the bucket in IAM policies, logging configurations, or for any service requiring an ARN.
  value = aws_s3_bucket.tfstate.arn
}

output "s3_bucket_id" {
  # The unique ID for the S3 bucket, which is useful if you need to reference the bucket programmatically or in other parts of your infrastructure.
  value = aws_s3_bucket.tfstate.id
}

output "s3_bucket_domain_name" {
  # This is the domain name of the S3 bucket, which is useful if you're going to use the bucket as a static website or reference it externally.
  value = aws_s3_bucket.tfstate.bucket_domain_name
}

output "s3_bucket_region" {
  # If you are using a multi-region setup, you might want to output the region of the S3 bucket to ensure the bucket is created in the correct region.
  value = aws_s3_bucket.tfstate.region
}



output "dynamodb_table_name" {
  # The name of the table, which is "tfstate-lock"
  value = aws_dynamodb_table.tfstate_lock.name
}

output "dynamodb_table_arn" {
  # The Amazon Resource Name (ARN) for the DynamoDB table. This is helpful if you need to reference the table in IAM policies or other AWS resources.
  value = aws_dynamodb_table.tfstate_lock.arn
}

output "dynamodb_table_id" {
  # The unique ID of the DynamoDB table. This can be useful for tracking or logging purposes.
  value = aws_dynamodb_table.tfstate_lock.id
}

# Provisioned Throughput (if you are using provisioned billing mode)
# Since this set_up is using PAY_PER_REQUEST, you don't need to output provisioned throughput settings, but if you use provisioned mode (PROVISIONED billing mode), you could output read and write capacity units like so:
# output "dynamodb_read_capacity" {
#   value = aws_dynamodb_table.tfstate_lock.provisioned_throughput[0].read_capacity_units
# }
# output "dynamodb_write_capacity" {
#   value = aws_dynamodb_table.tfstate_lock.provisioned_throughput[0].write_capacity_units
# }
