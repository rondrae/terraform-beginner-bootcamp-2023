output "ramdon_bucket_name" {
  value = aws_s3_bucket.website_bucket.id
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
  description = "The URL for the website"
}

output "cdn_endpoint" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}