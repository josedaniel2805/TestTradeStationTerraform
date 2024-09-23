variable "bucket_name" {
  description = "S3 bucket name."
  type        = string
}

variable "environment"{
    description = "Environment for deployment"
    type        = string
}

variable "s3_bucket_domain_name" {
  description = "S3 bucket regional domain name."
  type        = string
}

variable "cf_name" {
  description = "CF Distribution name"
  default     = "Bull Media CloudFront Distribution"
  type        = string
}
