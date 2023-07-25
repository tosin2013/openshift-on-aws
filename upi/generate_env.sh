#!/usr/bin/env bash

# Function to read input with default value
read_input() {
  prompt="$1"
  default_value="$2"
  read -rp "$prompt [$default_value]: " user_input
  echo "${user_input:-$default_value}"
}

# Read variables interactively
CLUSTER_NAME=$(read_input "Enter the CLUSTER_NAME" "my-cluster")
BASE_DOMAIN=$(read_input "Enter the BASE_DOMAIN" "example.com")
AWS_REGION=$(read_input "Enter the AWS_REGION" "us-east-1")
read -rp "Do you want to resume from an existing work directory? (y/n): " RESUME
RESUME=$(echo "$RESUME" | tr '[:upper:]' '[:lower:]')
[[ $RESUME == "y" || $RESUME == "yes" ]] && RESUME="true" || RESUME="false"

read -rp "Do you want to overwrite the existing work directory? (y/n): " OVERWRITE
OVERWRITE=$(echo "$OVERWRITE" | tr '[:upper:]' '[:lower:]')
[[ $OVERWRITE == "y" || $OVERWRITE == "yes" ]] && OVERWRITE="true" || OVERWRITE="false"

OPENSHIFT_PULL_SECRET=$(read_input "Enter the OPENSHIFT_PULL_SECRET" "")

# Read PUBLIC_SUBNET_01 and PRIVATE_SUBNET_01 interactively
PUBLIC_SUBNET_01=$(read_input "Enter the PUBLIC_SUBNET_01" "subnet-12345678")
PRIVATE_SUBNET_01=$(read_input "Enter the PRIVATE_SUBNET_01" "subnet-98765432")

VPC_ID

# Export the variables to a .env file
cat > .env <<EOF
export CLUSTER_NAME="$CLUSTER_NAME"
export BASE_DOMAIN="$BASE_DOMAIN"
export AWS_REGION="$AWS_REGION"
export RESUME="$RESUME"
export OVERWRITE="$OVERWRITE"
export OPENSHIFT_PULL_SECRET='$OPENSHIFT_PULL_SECRET'
export PUBLIC_SUBNET_01="$PUBLIC_SUBNET_01"
export PRIVATE_SUBNET_01="$PRIVATE_SUBNET_01"
export PRIVATE_SUBNET_IDS="$PRIVATE_SUBNET_01"
EOF

echo ".env file created successfully!"
echo "Please run 'source .env' to export the variables"
