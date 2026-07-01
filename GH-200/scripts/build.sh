#!/bin/bash

# Build script for GH-200 exam project
# This script demonstrates adding scripts to workflows

set -e

echo "=== Build Script ==="
echo "Starting build process..."

# Create build directory
mkdir -p build

# Display environment information
echo "Build environment:"
echo "  OS: $(uname -s)"
echo "  Architecture: $(uname -m)"
echo "  User: $(whoami)"
echo "  Directory: $(pwd)"

# Simulate compilation
echo "Compiling source code..."
sleep 1

# Create build artifacts
echo "Creating build artifacts..."
cat > build/app.txt <<EOF
Application Build
================
Version: ${VERSION:-1.0.0}
Built: $(date)
Environment: ${BUILD_ENV:-development}
EOF

echo "✅ Build completed successfully!"
echo "Output: build/app.txt"
