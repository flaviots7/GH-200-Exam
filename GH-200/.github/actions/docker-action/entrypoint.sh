#!/bin/bash

set -e

# Get inputs from arguments
TASK=$1
TARGET=$2
VERBOSE=$3

echo "=== Docker Container Action ==="
echo "Task: $TASK"
echo "Target: $TARGET"
echo "Verbose: $VERBOSE"
echo ""

# Function for verbose output
log_verbose() {
    if [ "$VERBOSE" == "true" ]; then
        echo "[VERBOSE] $1"
    fi
}

# Perform the task
case "$TASK" in
    analyze)
        echo "🔍 Analyzing $TARGET..."
        log_verbose "Starting analysis process"
        
        # Simulate analysis
        if [ -d "$TARGET" ]; then
            FILE_COUNT=$(find "$TARGET" -type f | wc -l)
            echo "Found $FILE_COUNT files"
            log_verbose "Listing files..."
            if [ "$VERBOSE" == "true" ]; then
                find "$TARGET" -type f
            fi
        else
            echo "Target is not a directory"
        fi
        
        # Set outputs using workflow commands
        echo "result=Analysis completed for $FILE_COUNT files" >> $GITHUB_OUTPUT
        echo "exit-code=0" >> $GITHUB_OUTPUT
        
        echo "✅ Analysis complete"
        ;;
        
    build)
        echo "🔨 Building $TARGET..."
        log_verbose "Starting build process"
        
        # Simulate build
        sleep 1
        
        echo "result=Build completed successfully" >> $GITHUB_OUTPUT
        echo "exit-code=0" >> $GITHUB_OUTPUT
        
        echo "✅ Build complete"
        ;;
        
    test)
        echo "🧪 Testing $TARGET..."
        log_verbose "Starting test execution"
        
        # Simulate tests
        echo "Running unit tests..."
        sleep 1
        echo "✓ All tests passed"
        
        echo "result=Tests passed" >> $GITHUB_OUTPUT
        echo "exit-code=0" >> $GITHUB_OUTPUT
        
        echo "✅ Tests complete"
        ;;
        
    *)
        echo "❌ Unknown task: $TASK"
        echo "Available tasks: analyze, build, test"
        echo "result=Unknown task" >> $GITHUB_OUTPUT
        echo "exit-code=1" >> $GITHUB_OUTPUT
        exit 1
        ;;
esac

# Display system information if verbose
if [ "$VERBOSE" == "true" ]; then
    echo ""
    echo "=== System Information ==="
    echo "OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
    echo "Bash: $BASH_VERSION"
    echo "Python: $(python3 --version)"
    echo "Git: $(git --version)"
fi

# Example: Using GitHub context from environment
echo ""
echo "=== GitHub Context ==="
echo "Repository: $GITHUB_REPOSITORY"
echo "Workflow: $GITHUB_WORKFLOW"
echo "Action: $GITHUB_ACTION"
echo "Actor: $GITHUB_ACTOR"

exit 0
