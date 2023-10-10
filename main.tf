terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}



provider "terratowns" {
  endpoint  = "http://localhost:4567/api"
  user_uuid = "e328f4ab-b99f-421c-84c9-4ccea042c7d1"
  token     = "9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}

# module "terrahouse_aws" {
#  source              = "./modules/terrahouse_aws"
#  user_uuid           = var.user_uuid
#  bucket_name         = var.bucket_name
#  index_html_filepath = var.index_html_filepath
#  error_html_filepath = var.error_html_filepath
#  content_version = var.content_version
#  assets_path = var.assets_path

# }

resource "terratowns_home" "home" {
  name = "Overwatch"
   description = <<DESCRIPTION
      Overwatch 2 is a free-to-play, team-based action game set in the optimistic future, 
      where every match is the ultimate 5v5 battlefield brawl...
      Play as a time-jumping freedom fighter, a beat-dropping battlefield DJ, 
      or one of over 30 other unique heroes as you battle it out around the globe.
      DESCRIPTION

  town = "gamers-grotto"
  content_version = 1
  #domain_name = module.terrahouse_aws.cdn_endpoint
  domain_name = "3rsasds.cloudfront.net"
}


