#!/bin/bash

# Deployment script for GH-200 exam project
# Demonstrates passing parameters to scripts

set -e

ENVIRONMENT=$1
VERSION=$2

if [ -z "$ENVIRONMENT" ] || [ -z "$VERSION" ]; then
    echo "Usage: $0 <environment> <version>"
    echo "Example: $0 staging v1.0.0"
    exit 1
fi

echo "=== Deployment Script ==="
echo "Environment: $ENVIRONMENT"
echo "Version: $VERSION"
echo "Timestamp: $(date)"
echo ""

# Validate environment
case "$ENVIRONMENT" in
    development|staging|production)
        echo "✅ Environment validated: $ENVIRONMENT"
        ;;
    *)
        echo "❌ Invalid environment: $ENVIRONMENT"
        echo "Valid options: development, staging, production"
        exit 1
        ;;
esac

# Simulate deployment steps
echo "Step 1: Preparing deployment package..."
sleep 1

echo "Step 2: Validating configuration..."
sleep 1

echo "Step 3: Deploying to $ENVIRONMENT..."
sleep 1

echo "Step 4: Running health checks..."
sleep 1

echo "✅ Deployment completed successfully!"
echo "Version $VERSION is now live in $ENVIRONMENT"

# Create deployment record
cat > "deployment-${ENVIRONMENT}.log" <<EOF
Deployment Record
=================
Environment: $ENVIRONMENT
Version: $VERSION
Date: $(date)
Status: SUCCESS
EOF

echo "Deployment log: deployment-${ENVIRONMENT}.log"
