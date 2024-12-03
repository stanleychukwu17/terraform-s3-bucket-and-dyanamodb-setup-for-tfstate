terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "tfstate-${var.region}-${timestamp()}"
  force_destroy = true # don't do this for production apps
}

# Enable versioning so we can see the history of our state as it changes, which is useful for debugging, you can uncomment the code for production apps
# resource "aws_s3_bucket_versioning" "tfstate_versioning" {
#   bucket = aws_s3_bucket.tfstate.bucket
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate_encryption" {
  bucket = aws_s3_bucket.tfstate.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # Use the default AES256 encryption algorithm
    }
  }
}

resource "aws_dynamodb_table" "tfstate_lock" {
  name           = "tfstate-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}