output "bucket_id" {
  value       = aws_s3_bucket.bucket.id
  description = "The name of the bucket."
}

output "bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
}

output "bucket_dns" {
  value       = aws_s3_bucket.bucket.bucket_domain_name
  description = " The bucket domain name."
}

output "bucket_regional_dns" {
  value       = aws_s3_bucket.bucket.bucket_regional_domain_name
  description = "The bucket region-specific domain name. "
}

output "bucket_hosted_zone_id" {
  value       = aws_s3_bucket.bucket.hosted_zone_id
  description = "The Route 53 Hosted Zone ID for this bucket's region."
}

output "bucket_region" {
  value       = aws_s3_bucket.bucket.region
  description = "The AWS region this bucket resides in."
}

output "bucket_tags_all" {
  value       = aws_s3_bucket.bucket.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "bucket_website_endpoint" {
  value       = aws_s3_bucket.bucket.website_endpoint
  description = " The website endpoint, if the bucket is configured with a website."
}

output "bucket_website_domain" {
  value       = aws_s3_bucket.bucket.website_domain
  description = " The website endpoint, if the bucket is configured with a website."
}
