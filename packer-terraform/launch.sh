#!/bin/bash
ARTIFACT=`packer build -machine-readable packer-test.json | awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT |cut -d ':' -f2`
echo 'variable "AMI_ID" { default = "'ami-fa27b39a'" }' > amivar.tf
terraform apply
