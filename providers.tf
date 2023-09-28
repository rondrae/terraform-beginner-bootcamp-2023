terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
  cloud {
  organization = "drae-terraform"

  workspaces {
      name = "terra-house-sleep"
    }
  }
}

provider "random" {
  # Configuration options
}



provider "aws" {
  # Configuration options
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}