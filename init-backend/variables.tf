variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "us-east-1"  # <-- Change to your preferred AWS region
}

variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
  default     = "my-tf-backend-joshua"  # <-- Change to a globally unique bucket name
}


