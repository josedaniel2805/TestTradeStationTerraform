output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.new_cloudfront_distribution.domain_name
}

output "cloudfront_arn" {
  value = aws_cloudfront_distribution.new_cloudfront_distribution.arn
}