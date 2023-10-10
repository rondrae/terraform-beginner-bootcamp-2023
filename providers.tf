terraform {
  #required_providers {

  }
  # cloud {
  #   organization = "drae-terraform"

  #   workspaces {
  #     name = "terra-house-sleep"
  #   }
  # }
#}

provider "random" {
  # Configuration options
}



provider "aws" {
  # Configuration options
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}


