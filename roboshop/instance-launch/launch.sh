#!/bin/bash
COMPONENT=$1

## =z validates the variable empty , true if its empty
if [-z "${COMPONENT}" ]; then
  echo "component input is needed"
  exit 1
fi

LID=lt-01a6a766d909e9e29
LVER=1

aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER} --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=COMPONENT}]"

