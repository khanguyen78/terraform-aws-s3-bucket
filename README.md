# terraform-aws-s3-bucket

### AWS S3 bucket Terraform module

Terraform aws s3 bucket module

Usage


s3.tf:
```
module "bucket_a" {
  source = "git::https://github.com/khanguyen78/terraform-aws-s3-bucket.git"
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

```

locals.tf:

```
locals {
  environment = "dev"
  owner = "kqmap"
  project = "learning-tf"
  region = "us-eat-1"
  team = "devops"
  
  default_tags = {
    environment = local.environment
    owner = local.owner
    project = local.project
    team = local.team
  }
}


```
Run a `terraform apply` and a bucket named `kqmap-learning-tf-dev` should get created.
