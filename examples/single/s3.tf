module "bucket_a" {
  #source = "git::https://github.com/khanguyen78/terraform-aws-s3-bucket.git"
  source = "../../"
  bucket = "${local.project}-${local.environment}"

  tags = {
    Name = "${local.owner}-${local.project}-${local.environment}"
  }
}

output "bucket_a_id" {
  value = module.bucket_a.bucket_id
}

output "bucket_a_arn" {
  value = module.bucket_a.bucket_arn
}

output "bucket_a_domain_name" {
  value = module.bucket_a.bucket_dns
}
output "bucket_a_regional_domain_name" {
  value = module.bucket_a.bucket_regional_dns
}
output "bucket_a_region" {
  value = module.bucket_a.bucket_region
}
output "bucket_a_tags_all" {
  value = module.bucket_a.bucket_tags_all
}
