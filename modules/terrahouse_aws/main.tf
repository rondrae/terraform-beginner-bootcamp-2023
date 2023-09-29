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


resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  #source = var.index_html_filepathacl 
  source = var.index_html_filepath
  etag = filemd5(var.index_html_filepath)
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = var.error_html_filepath

  etag = filemd5(var.error_html_filepath)
}