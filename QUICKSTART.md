# Quick Start Guide

## Initial Setup

### 1. Push to GitHub

```bash
# Initialize git repository (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: GH-200 exam preparation project"

# Add your GitHub repository as remote
git remote add origin https://github.com/YOUR-USERNAME/gh200-exam-prep.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### 2. Verify Workflows

1. Go to your repository on GitHub
2. Click the "Actions" tab
3. You should see all workflows listed
4. Click on any workflow to see its details

### 3. Trigger Your First Workflow

**Option A: Manual Trigger**
1. Go to Actions tab
2. Click "03 - Event Triggers - Manual" workflow
3. Click "Run workflow" button
4. Select inputs and run

**Option B: Push Trigger**
1. Make a small change to README.md
2. Commit and push:
   ```bash
   git add README.md
   git commit -m "Test workflow trigger"
   git push
   ```
3. Check Actions tab to see workflow running

## Common Tasks

### Run a Specific Workflow

Most workflows can be triggered manually:
1. Actions tab > Select workflow > Run workflow

### View Workflow Logs

1. Actions tab > Click on a workflow run
2. Click on a job name
3. Expand steps to see detailed logs

### Enable Debug Logging

1. Settings > Secrets and variables > Actions
2. New repository secret:
   - Name: `ACTIONS_STEP_DEBUG`
   - Value: `true`
3. New repository secret:
   - Name: `ACTIONS_RUNNER_DEBUG`
   - Value: `true`
4. Re-run any workflow

### Download Artifacts

1. Go to a completed workflow run
2. Scroll to "Artifacts" section
3. Click to download

## Learning Workflow

1. **Read the README.md** - Comprehensive guide
2. **Follow the Learning Path** - Structured 4-week plan
3. **Explore Workflows** - Start with 01, go sequentially
4. **Run Each Workflow** - Hands-on practice
5. **Modify and Experiment** - Best way to learn
6. **Create Your Own** - Apply what you learned

## Troubleshooting

### Workflow Not Appearing

- Check `.github/workflows/` directory exists
- Verify YAML syntax is valid
- Ensure workflow has valid triggers

### Workflow Failing

- Read the error message in logs
- Check YAML indentation
- Verify all required inputs are provided
- Enable debug logging for more details

### Actions Not Running

- Verify GitHub Actions is enabled (Settings > Actions)
- Check if workflow is disabled
- Verify trigger conditions are met

## Next Steps

After completing the quick start:

1. **Week 1**: Study Domain 1 workflows (01-14)
2. **Week 2**: Study Domain 2 workflows (15-20)
3. **Week 3**: Study Domain 3 custom actions
4. **Week 4**: Study Domain 4 enterprise features

## Need Help?

- Read workflow comments
- Check README.md for detailed explanations
- Review official study guide
- Refer to GitHub Actions documentation

Good luck with your GH-200 exam preparation! 🚀
