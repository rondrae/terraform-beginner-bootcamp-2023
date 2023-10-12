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
  # cloud {
  #   organization = "drae-terraform"

  #   workspaces {
  #     name = "terra-house-sleep"
  #   }
  # }
}



provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token     = var.terratowns_access_token
}

module "terrahouse_aws" {
  source    = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  #bucket_name         = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version     = var.content_version
  assets_path         = var.assets_path

}

resource "terratowns_home" "home" {
  name        = "Jamaican Bread Pudding"
  description = <<DESCRIPTION
      It is a favourite for those with a sweet tooth and is enjoyed by Jamaican 
      citizens living here as well as Jamaicans worldwide who likes to take a piece of Jamaica with them wherever they go.  
      So go ahead and enjoy using this bread pudding recipe to satisfy that craving or sweet tooth.
      DESCRIPTION

  town            = "cooker-cove"
  
  content_version = 10
  domain_name     = module.terrahouse_aws.cdn_endpoint
  #domain_name = "3rsasds.cloudfront.net"
}







