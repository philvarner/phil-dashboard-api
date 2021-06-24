#!/bin/bash
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity | jq .Account -r)
export AWS_REGION=$(aws configure get region)
export REG=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

aws ecr get-login-password --region ${AWS_REGION} | docker login --password-stdin --username AWS ${REG}

cdk deploy -vvv --all --require-approval never
