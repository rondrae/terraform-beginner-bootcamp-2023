# Terraform Beginner Bootcamp 2003 - Week 1

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
