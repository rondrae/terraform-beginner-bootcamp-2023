# Terraform Beginner Bootcamp 2023 - Week 0


![Week_0_diagram](https://github.com/rondrae/terraform-beginner-bootcamp-2023/assets/18177131/8656ece8-394d-4805-8c84-565a5c97ee4a)


## Table of Content

- [Install Terraform CLI](#install-the-terraform-cli)
- [Refactor Terraform installation into a Bash Scripts](#refactor-terraform-installation-into-a-bash-scripts)
- [Consideration for Linux Distro](#consideration-for-linux-distro)
- [Andrew's Trap Card - Gitpod LifeCycle](#andrews-trap-card---gitpod-lifecycle)
- [Persisting Env Vars in Gitpod](#persisting-env-vars-in-gitpod)
- [AWS CLI Installation](#aws-cli-installation)
- [Terraform Basics](#terraform-basics)
- [Terraform Registry](#terraform-registry)
- [Created S3 bucket using Terraform](#created-s3-bucket-using-terraform)
- [Added Terraform Cloud]()


## Install the Terraform CLI

The installation instructions have changed because of gpg keyring changes. So the original gitpod yaml was using something deprecated. 

[Install the Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


### Refactor Terraform installation into a Bash Scripts

While fixing the gpg issue we notice that the latest installation issues steps has more steps, so we decided to create a bash script. This will allow for better portability. Script Location is [./bin/install_terraform_cli](./bin/install_terraform_cli)


### Consideration for Linux Distro

This project is based on Ubuntu 22.04, so please check commands and script to ensure they work with your distro.


### Andrew's Trap Card - Gitpod LifeCycle

Instead of using init, use before. The reason for this is if you open an already created gitpod workspace it does not go through the init phase.

https://www.gitpod.io/docs/configure/workspaces/tasks



#### Persisting Env Vars in Gitpod

Store the env vars in Gitpod Storage using this command -  gp env PROJECT_ROOT='/workspace/terraform-beginner-bootcamp-2023'


### AWS CLI Installation

AWS CLI is installed for this project via bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting Started Installing AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)


You will need to generate access keys for an aws iam user to use with the environment variables.
Check if AWS credentials are configured properly.
```sh
aws sts get-caller-identity
```

## Terraform Basics

### Terraform Registry

Terraform registry is where you get the providers and modules. [Terraform Registry](https://registry.terraform.io)


We used Terraform random provider to generate a random string for a bucket name. [Terraform Random String Provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)



## Created S3 bucket using Terraform

I used a Terraform Randon String Provider to provide a name. S3 only takes lower case in the name so I made min_lower value the same as the length.
```  length           = 16
     special          = false
     override_special = "/@£$"
     min_lower = 16 ```

### Added Terraform Cloud

Terraform cloud is now our backend for our tfstate. The current state was migrated to the cloud.
Used a bash script generate and store the token.
