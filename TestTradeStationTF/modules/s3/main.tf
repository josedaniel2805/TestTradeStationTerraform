resource "aws_s3_bucket" "new_bucket" {
  bucket = var.bucket_name

  tags = {
        Name        = var.bucket_name
        Environment = var.environment
    }
}

resource "aws_s3_bucket_public_access_block" "media_bucket_public_access_block" {
  bucket = aws_s3_bucket.new_bucket.id

  block_public_acls       = true
  block_public_policy     = false # Set to false to allow the CloudFront policy to be applied
  ignore_public_acls      = true
  restrict_public_buckets = true
}

