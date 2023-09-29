output "bucket_name" {
  description = "Bucket Name for static website"
  value       = module.terrahouse_aws.ramdon_bucket_name
}

output "s3_website_endpoint" {
  value       = module.terrahouse_aws.website_endpoint
  description = "The URL for the website"
}