locals {
  region = "us-east-1"
  environment = "dev"
  owner = "kqmap"
  project = "learning-tf"
  team = "devops"
  
  default_tags = {
    environment = local.environment
    owner = local.owner
    project = local.project
    team = local.team
  }
}
