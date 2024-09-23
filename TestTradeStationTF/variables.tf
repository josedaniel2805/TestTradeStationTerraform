variable "region" {
  description = "Region for resources deployment."
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "S3 Bucket Name"
  default     = "bull-media1"
}

variable "environment"{
    description = "Environment for deployment"
    default     = "Dev"
}

variable "access_key"{
    description = "Access key"
    type        = string
}

variable "secret_key"{
    description = "Secret key"
    type        = string
}