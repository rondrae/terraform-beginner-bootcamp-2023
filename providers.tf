terraform {
  #required_providers {

}

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


