
resource "random_string" "bucket_name" {
  length           = 4
  special          = false
  override_special = "/@£$"
  min_lower = 4
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = "bucket-${random_string.bucket_name.result}"
  tags = {
    UserUuid = var.user_uuid
  }
}



