#!/usr/bin/env python3

"""
Analysis script for GH-200 exam project
Demonstrates using Python scripts in workflows
"""

import sys
import os
from datetime import datetime

def main():
    print("=== Python Analysis Script ===")
    print(f"Python version: {sys.version}")
    print(f"Script started at: {datetime.now()}")
    print()
    
    # Analyze current directory
    print("Analyzing project structure...")
    
    file_count = 0
    workflow_count = 0
    action_count = 0
    
    for root, dirs, files in os.walk('.'):
        for file in files:
            file_count += 1
            if 'workflows' in root and file.endswith('.yml'):
                workflow_count += 1
            if 'actions' in root and file == 'action.yml':
                action_count += 1
    
    print(f"📊 Analysis Results:")
    print(f"  Total files: {file_count}")
    print(f"  Workflow files: {workflow_count}")
    print(f"  Custom actions: {action_count}")
    print()
    
    # Generate report
    report = f"""
Analysis Report
===============
Generated: {datetime.now()}
Project: GH-200 Exam Preparation

Statistics:
- Total files: {file_count}
- Workflows: {workflow_count}
- Actions: {action_count}

Status: ✅ Analysis complete
"""
    
    print(report)
    
    # Save report to file
    with open('analysis-report.txt', 'w') as f:
        f.write(report)
    
    print("Report saved to: analysis-report.txt")
    return 0

if __name__ == '__main__':
    sys.exit(main())
