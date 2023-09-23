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
}



resource "random_string" "bucket_name" {
  length           = 16
  special          = false
  override_special = "/@£$"
  min_lower = 16
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result


}

output "ramdon_bucket_name" {
  value = random_string.bucket_name.id
}

