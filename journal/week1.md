

# Terraform Beginner Bootcamp 2003 - Week 1


![Week_1_diagram](https://github.com/rondrae/terraform-beginner-bootcamp-2023/assets/18177131/bcb40344-4e09-460f-a243-8490f16b5e97)


## Root Module structure

All files need to be in root folder

```
- Project_ROOT
    - variables.tf - stores input variables
    - main.tf - the main file
    - providers.tf - for providers
    - terraform.tfvars - data for variables we want to load
    - outputs.tf - outputs for other modules if needed
```

## Restructured Root MOdule

I restructured the root module by creating various .tf and a tfvars file. The filenames are listed above. I also added my AWS keys to the tfvars file because gitpod or terraform cloud was not reading environmental variables.

## Refactor Bucket name

I changed the bucket name from 16 random characters to bucket- 4 random characters. Also fixed config drift with s3 bucket.

## Terraform Modules

Added a module called terrahouse. This was used to create an s3 bucket that will store our website.

### Modules Sources 

``` 
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name

}

```


## Create Static S3 Website

I created a static s3 website with 2 .html files, index and error. I use terraform to create the s3 website and created 2 s3 objects. One for the error.html and the other for the index.html. I had a error with the file location, so I migrated by tfstate file back to local. TF cloud is sometimes a headache. Before the files are uploaded to the s3 bucket, I first check if the file exists and if its, it is uploaded to s3, if not you get an erorr saying file not found. I also created an output for the website URL.


## CDN Implementation

Added a CDN that points to the s3 buckets, created a bucket policy using the IAM for user terraboot. I change the error.html and index.html file to include actual html code instead of just text.
I also added an output to display the CDN enpoint in the console so that I would have to log into the AWS console to get it :-)

``` 
output "cdn_endpoint" {
  value = module.terrahouse_aws.cdn_endpoint
} 


## Setup Content Version

Added contect version so that changes happen only when the contect version number is incremented. Use terraform_data resource because we need to tie content version to a resource and when we change that resource, changes we make are applied. *poor explanation*

 resource "terraform_data" "content_version" {
  input = var.content_version  
} 

```
## Invalidate CloudFront Distribution

Added code to invalidate cloudfront distribution. We used terraform_data again and the trigger was the previous terraform_data. So whenever the content version is changed it will invalidate cache, so that our users no longer pull outdated cache data. We use a provisioner with local-exec to run a command using aws cli to get this done. See code below. Terraform recommends we do not use local-exec but I love it. :-) Andrew really is hungry and tired.

```
resource "terraform_data" "invalidate_cache" {
  triggers_replace = terraform_data.content_version.output

  provisioner "local-exec" {
    # https://developer.hashicorp.com/terraform/language/expressions/strings#heredoc-strings
    command = <<COMMAND
aws cloudfront create-invalidation \
--distribution-id ${aws_cloudfront_distribution.s3_distribution.id} \
--paths '/*'
    COMMAND

  }
}

```

## Upload Assets

Used for_each to upload all the pictures from the assets folder. It  went through each file, check if its jpg, png or gif, if it is then it is then uploaded.
```
resource "aws_s3_object" "upload_assets" {
  for_each = fileset("${path.root}/public/assets","*.{jpg,png,gif}")
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "assets/${each.key}"
  source = "${var.assets_path}/${each.key}"
  #content_type = "text/html"
  etag = filemd5("${var.assets_path}/${each.key}")
  lifecycle {
    replace_triggered_by = [ terraform_data.content_version.output ]
    ignore_changes = [ etag ]
  }
}

```
