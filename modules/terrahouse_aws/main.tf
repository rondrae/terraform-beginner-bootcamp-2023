provider "random" {
  # Configuration options
}


resource "random_string" "website_bucket" {
  length           = 4
  special          = false
  override_special = "/@£$"
  min_lower = 4
}



resource "aws_s3_bucket" "website_bucket" {
  bucket = "bucket-${random_string.website_bucket.result}"
  tags = {
    UserUuid = var.user_uuid
  }
}
