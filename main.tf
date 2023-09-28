
resource "random_string" "bucket_name" {
  length           = 16
  special          = false
  override_special = "/@£$"
  min_lower = 16
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
  tags = {
    UserUuid = var.user_uuid
  }
}



