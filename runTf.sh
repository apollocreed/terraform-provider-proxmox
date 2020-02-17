#!/bin/sh


terraform init -plugin-dir="/terraform/plugins"
terraform plan -var-file=proxmox.tfvars -out plan.file
terraform apply plan.file
