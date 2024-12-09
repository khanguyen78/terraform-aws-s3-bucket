provider "aws" {
  region = local.region
  default_tags  {
    tags = {
      environment = local.environment
      owner = local.owner
      project = local.project
      team = local.team
    }
  }

}

data "aws_caller_identity" "current" {}

terraform {
  backend "s3" {
    bucket = "kqmap-terraform"
    key = "terraform/s3-dev"
    encrypt = "true"
    region = "us-east-1"
  }
}
  
