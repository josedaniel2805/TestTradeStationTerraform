terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

module "s3_bucket" {
  source = "./modules/s3"
  environment = var.environment
  bucket_name = var.s3_bucket_name
}

module "s3_policy" {
  source = "./modules/s3_policy"

  s3_bucket_arn   = module.s3_bucket.s3_bucket_arn
  s3_bucket_name  = module.s3_bucket.s3_bucket_name
  cloudfront_domain_name = module.cloudfront_distribution.cloudfront_domain_name
  cloudfront_arn = module.cloudfront_distribution.cloudfront_arn
}

module "cloudfront_distribution" {
  source            = "./modules/cloudFront"
  bucket_name = module.s3_bucket.s3_bucket_name
  environment = var.environment
  s3_bucket_domain_name = module.s3_bucket.s3_bucket_domain_name
}