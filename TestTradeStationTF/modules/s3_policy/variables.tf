variable "s3_bucket_name" {
  description = "S3 bucket name."
  type        = string
}

variable "s3_bucket_arn" {
  description = "S3 bucket ARN."
  type        = string
}

variable "cloudfront_domain_name" {
  description = "CloudFront distribution domain."
  type        = string
}

variable "cloudfront_arn" {
  description = "CloudFront ARN."
  type        = string
}
