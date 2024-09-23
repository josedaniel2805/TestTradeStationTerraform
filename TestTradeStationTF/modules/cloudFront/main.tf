resource "aws_cloudfront_distribution" "new_cloudfront_distribution" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = "S3-${var.bucket_name}-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_oac.id
  }

  enabled = true

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.bucket_name}-origin"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
        Name        = var.cf_name
        Environment = var.environment
    }
}

resource "aws_cloudfront_origin_access_control" "s3_oac" {
  name                                  = "s3-oac-for-cloudfront"
  description                           = "OAC to restrict S3 access to CloudFront"
  origin_access_control_origin_type     = "s3"
  signing_behavior                      = "always"
  signing_protocol                      = "sigv4"
}