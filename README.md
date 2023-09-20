# Terraform Beginner Bootcamp 2023


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

