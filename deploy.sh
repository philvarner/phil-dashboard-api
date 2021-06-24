#!/bin/bash
aws ecr get-login-password --region ${AWS_REGION} | docker login --password-stdin --username AWS ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

cdk deploy -vvv --all --require-approval never
