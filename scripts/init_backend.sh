#!/bin/bash

while getopts "r:e:p:" flag; do
  case "${flag}" in
  r) AWS_REGION=${OPTARG} ;;
  e) ENVIRONMENT_NAME=${OPTARG} ;;
  p) PROJECT_NAME=${OPTARG} ;;
  *)
    echo "Invalid parameter provided"
    exit 1
    ;;
  esac

done

BUCKET_NAME="${PROJECT_NAME}-${ENVIRONMENT_NAME}-tfstates"

# Create S3 bucket to store tfstates
aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$AWS_REGION" --acl private --create-bucket-configuration LocationConstraint="$AWS_REGION"

sleep 10

# Add encryption to S3 bucket
aws s3api put-bucket-encryption --bucket "$BUCKET_NAME" --server-side-encryption-configuration '{
    "Rules": [
        {
            "ApplyServerSideEncryptionByDefault": {
                "SSEAlgorithm": "AES256"
            }
        }
    ]
}'

sleep 10

# Add versioning to S3 bucket
aws s3api put-bucket-versioning --bucket "$BUCKET_NAME" --versioning-configuration Status=Enabled

sleep 10

# Add tags to S3 bucket
# shellcheck disable=SC2086
aws s3api put-bucket-tagging --bucket $BUCKET_NAME --tagging "TagSet=[{Key=Name,Value=${BUCKET_NAME}},{Key=Environment,Value=${ENVIRONMENT_NAME}},{Key=ManagedBy,Value=script}]"

sleep 10
