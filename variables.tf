variable "region" {}
variable "access_key" {}
variable "secret_key" {}

variable "teacherseat_user_uuid" {
  default = "user"
}

variable "bucket_name" {
  default = "bucket"
}

variable "index_html_filepath" {
  type = string

}

variable "error_html_filepath" {
  type = string

}

variable "content_version" {
  description = "The content version. Should be a positive integer starting at 1."
  type        = number
}

variable "assets_path" {
  type        = string
  description = "path to assets folder"
}

variable "terratowns_access_token" {
  
}
variable "terratowns_endpoint" {
  
}
