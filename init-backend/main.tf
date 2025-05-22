provider "aws" {
  region = var.aws_region
}

# S3 Bucket to store Terraform state
resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name  # <-- Use a globally unique bucket name
  force_destroy = true  # Optional: delete all objects if bucket is deleted

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Shared"
  }
}

# Enable versioning (now separate resource)
#This tells AWS:"Please keep a history of every change made to any file in this S3 bucket."
resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption (now separate resource)
#This tells AWS:"Automatically encrypt every file uploaded to this S3 bucket using the AES256 standard."
resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_encryption" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
