#!/bin/bash

# Takes three arguments:
#   bucket name - one that has already been created
#   name of key file - without .pem extension
#   number of slave instances
#      ex. bash launch_cluster.sh mybucket mypem 2

# Requires the awscli to be set up, need to have correct default region configured
# Run `aws configure` to set this up

aws s3 cp bootstrap-emr.sh s3://$1/scripts/bootstrap-emr.sh

aws emr create-cluster \
    --name PySparkCluster \
    --release-label emr-5.0.3 \
    --applications Name=Spark \
    --ec2-attributes KeyName=$2 \
    --use-default-roles \
    --instance-groups \
      InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m3.2xlarge \
      InstanceGroupType=CORE,InstanceCount=$3,InstanceType=m3.2xlarge \
    --bootstrap-actions Path=s3://$1/scripts/bootstrap-emr.sh
