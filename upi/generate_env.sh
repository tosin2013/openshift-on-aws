#!/usr/bin/env bash

# Read variables interactively
read -rp "Enter the CLUSTER_NAME: " CLUSTER_NAME
read -rp "Enter the BASE_DOMAIN: " BASE_DOMAIN
read -rp "Enter the AWS_REGION: " AWS_REGION
read -rp "Do you want to resume from an existing work directory? (y/n): " RESUME
read -rp "Do you want to overwrite the existing work directory? (y/n): " OVERWRITE
read -rp "Enter the OPENSHIFT_PULL_SECRET: " OPENSHIFT_PULL_SECRET

# Export the variables
cat ><<EOF >.env
export CLUSTER_NAME="${CLUSTER_NAME}"
export BASE_DOMAIN="${BASE_DOMAIN}"
export AWS_REGION="${AWS_REGION}"
export RESUME="${RESUME}"
export OVERWRITE="${OVERWRITE}"
export OPENSHIFT_PULL_SECRET='${OPENSHIFT_PULL_SECRET}'
EOF

echo ".env file created successfully!"
echo "Please run 'source .env' to export the variables"