#!/bin/bash

# fail on any error
set -eu

# install yum-config-manager to manage your repo
sudo yum install -y yum-utils shadow-utils

# use yum-config-manager to add official Hascicorp linux repo
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

# install terraform
sudo yum -y install terraform

# verify terraform version
terraform --version