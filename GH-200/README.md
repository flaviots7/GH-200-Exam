# GH-200: GitHub Actions Certification - Complete Learning Project

Welcome to the comprehensive GitHub Actions GH-200 certification exam preparation project! This repository contains practical, hands-on examples covering all topics in the official Microsoft certification exam study guide.

## 📋 Table of Contents

- [About This Project](#about-this-project)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Exam Domains](#exam-domains)
  - [Domain 1: Author and Maintain Workflows (40%)](#domain-1-author-and-maintain-workflows-40)
  - [Domain 2: Consume Workflows (20%)](#domain-2-consume-workflows-20)
  - [Domain 3: Author and Maintain Actions (25%)](#domain-3-author-and-maintain-actions-25)
  - [Domain 4: Manage GitHub Actions in the Enterprise (15%)](#domain-4-manage-github-actions-in-the-enterprise-15)
- [Project Structure](#project-structure)
- [Learning Path](#learning-path)
- [Hands-On Exercises](#hands-on-exercises)
- [Exam Tips](#exam-tips)
- [Additional Resources](#additional-resources)

## About This Project

This project provides:
- ✅ **22 comprehensive workflow examples** covering all exam topics
- ✅ **3 types of custom actions** (JavaScript, Docker, Composite)
- ✅ **Reusable workflows** and organization templates
- ✅ **Sample application** with CI/CD pipelines
- ✅ **Detailed comments** explaining every concept
- ✅ **Real-world scenarios** aligned with exam objectives

## Prerequisites

Before starting, you should have:
- A GitHub account
- Basic understanding of Git and version control
- Familiarity with YAML syntax
- Basic command-line knowledge
- Understanding of CI/CD concepts

## Getting Started

### 1. Clone or Push This Repository

```bash
# Clone to your GitHub account (recommended)
# Or push this project to your GitHub repository

git remote add origin https://github.com/YOUR-USERNAME/gh200-exam-prep.git
git branch -M main
git push -u origin main
```

### 2. Enable GitHub Actions

1. Go to your repository on GitHub
2. Click on the "Actions" tab
3. GitHub Actions should be enabled by default

### 3. Configure Repository Secrets (Optional)

For practicing with secrets:
1. Go to Settings > Secrets and variables > Actions
2. Add new repository secrets:
   - `DOCKER_USERNAME` (optional)
   - `DOCKER_PASSWORD` (optional)

### 4. Explore the Workflows

Navigate to `.github/workflows/` to see all example workflows. Each workflow is numbered and corresponds to specific exam topics.

---

## Exam Domains

## Domain 1: Author and Maintain Workflows (40%)

This domain covers creating, configuring, and maintaining GitHub Actions workflows.

### 1.1 Work with Events that Trigger Workflows

**📁 Workflows:** `01-04`

#### [01 - Event Triggers - Push and Pull Request](.github/workflows/01-event-triggers-push.yml)
- ✅ Configure workflows for push events
- ✅ Filter by branches, paths, and tags
- ✅ Handle pull request events
- ✅ Use pull_request_target

**Key Concepts:**
```yaml
on:
  push:
    branches: [main, 'feature/**']
    paths: ['src/**']
    tags: ['v*']
  pull_request:
    types: [opened, synchronize]
```

#### [02 - Event Triggers - Scheduled](.github/workflows/02-event-triggers-scheduled.yml)
- ✅ Configure cron schedules
- ✅ Multiple schedule triggers
- ✅ Understand cron syntax

**Key Concepts:**
```yaml
on:
  schedule:
    - cron: '0 0 * * *'  # Daily at midnight UTC
    - cron: '0 12 * * 1' # Mondays at noon UTC
```

#### [03 - Event Triggers - Manual](.github/workflows/03-event-triggers-manual.yml)
- ✅ workflow_dispatch inputs
- ✅ Input types: choice, boolean, string
- ✅ Default values and validation

**Key Concepts:**
```yaml
on:
  workflow_dispatch:
    inputs:
      environment:
        type: choice
        options: [dev, staging, prod]
```

#### [04 - Event Triggers - Webhook](.github/workflows/04-event-triggers-webhook.yml)
- ✅ Issues and issue_comment events
- ✅ Release events
- ✅ Deployment events
- ✅ check_run and check_suite
- ✅ workflow_run

**Webhook Events Reference:**
- `issues`: opened, closed, labeled
- `release`: published, created
- `deployment`: created
- `deployment_status`: created, updated
- `check_run`: completed
- `check_suite`: completed

### 1.2 Use the Components of a Workflow

**📁 Workflows:** `05-09`

#### [05 - Workflow Components - Job Syntax](.github/workflows/05-workflow-components-syntax.yml)
- ✅ Job structure and naming
- ✅ Matrix strategies
- ✅ Service containers
- ✅ Container jobs
- ✅ Job outputs
- ✅ Timeouts

**Key Concepts:**
```yaml
jobs:
  build:
    name: Build Application
    runs-on: ubuntu-latest
    timeout-minutes: 10
    outputs:
      version: ${{ steps.version.outputs.version }}
    strategy:
      matrix:
        node: [18, 20]
```

#### [06 - Workflow Components - Conditionals](.github/workflows/06-workflow-components-conditionals.yml)
- ✅ if conditions
- ✅ Logical operators (&&, ||, !)
- ✅ Functions: contains(), startsWith(), endsWith()
- ✅ Status check functions: success(), failure(), always()
- ✅ Step outcome vs conclusion

**Conditional Examples:**
```yaml
- name: Run on main only
  if: github.ref == 'refs/heads/main'

- name: Run if NOT contains [skip ci]
  if: "!contains(github.event.head_commit.message, '[skip ci]')"

- name: Always run cleanup
  if: always()
```

#### [07 - Workflow Components - Dependent Jobs](.github/workflows/07-workflow-components-dependent-jobs.yml)
- ✅ needs keyword for job dependencies
- ✅ Multiple dependencies
- ✅ Passing data with outputs
- ✅ Conditional job execution

**Job Dependencies:**
```yaml
jobs:
  build:
    outputs:
      version: ${{ steps.version.outputs.version }}
      
  test:
    needs: build
    
  deploy:
    needs: [build, test]
    steps:
      - run: echo ${{ needs.build.outputs.version }}
```

#### [08 - Secrets and Environment Variables](.github/workflows/08-secrets-and-variables.yml)
- ✅ Default environment variables
- ✅ Custom environment variables
- ✅ Workflow commands (set-output, set-env)
- ✅ Using secrets
- ✅ GITHUB_TOKEN usage

**Environment Variable Scopes:**
```yaml
env:
  WORKFLOW_VAR: value  # Workflow level

jobs:
  job1:
    env:
      JOB_VAR: value   # Job level
    steps:
      - env:
          STEP_VAR: value  # Step level
```

#### [09 - Runners - Comparison](.github/workflows/09-runners-comparison.yml)
- ✅ GitHub-hosted runners
- ✅ Self-hosted runners
- ✅ Runner labels
- ✅ When to use each type

**Runner Selection:**
```yaml
runs-on: ubuntu-latest              # GitHub-hosted
runs-on: [self-hosted, linux, x64]  # Self-hosted
```

### 1.3 Create Workflows for Specific Purposes

**📁 Workflows:** `10-14`

#### [10 - Scripts in Workflows](.github/workflows/10-scripts-in-workflows.yml)
- ✅ Inline scripts
- ✅ External script files
- ✅ Multiple shell types
- ✅ Script outputs and error handling

**Script Examples:**
```yaml
- name: Bash script
  run: |
    echo "Multi-line script"
    ./scripts/build.sh

- name: Python script
  shell: python
  run: |
    import sys
    print(f"Python {sys.version}")
```

#### [11 - Publish to GitHub Packages](.github/workflows/11-publish-github-packages.yml)
- ✅ Publish NPM packages
- ✅ Publish Maven packages
- ✅ Publish Docker images to GHCR
- ✅ Publish NuGet packages

**Publishing Example:**
```yaml
- name: Publish to GitHub Packages
  run: npm publish
  env:
    NODE_AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

#### [12 - CodeQL Security Scanning](.github/workflows/12-codeql-security.yml)
- ✅ Initialize CodeQL
- ✅ Autobuild for compiled languages
- ✅ Custom CodeQL configuration
- ✅ SARIF upload

**CodeQL Workflow:**
```yaml
- uses: github/codeql-action/init@v3
  with:
    languages: javascript

- uses: github/codeql-action/autobuild@v3

- uses: github/codeql-action/analyze@v3
```

#### [13 - Create GitHub Release](.github/workflows/13-github-release.yml)
- ✅ Build release artifacts
- ✅ Generate release notes
- ✅ Create GitHub release
- ✅ Upload release assets

**Release Creation:**
```yaml
- uses: softprops/action-gh-release@v1
  with:
    tag_name: v1.0.0
    files: |
      dist/*.zip
      dist/*.tar.gz
```

#### [14 - Cloud Deployment](.github/workflows/14-cloud-deployment.yml)
- ✅ Deploy to Azure
- ✅ Deploy to AWS
- ✅ Deploy to GCP
- ✅ Deploy to Kubernetes
- ✅ Environment protection

**Deployment Example:**
```yaml
jobs:
  deploy:
    environment:
      name: production
      url: https://app.example.com
```

---

## Domain 2: Consume Workflows (20%)

This domain covers using, monitoring, and troubleshooting workflows.

### 2.1 Interpret the Effects of a Workflow

**📁 Workflows:** `18`

#### [18 - Debugging and Troubleshooting](.github/workflows/18-debugging.yml)
- ✅ Enable step debug logging
- ✅ Workflow commands for logging
- ✅ Diagnose failed runs
- ✅ Access workflow logs (UI and API)

**Debug Logging:**
```bash
# Enable in repository secrets:
ACTIONS_STEP_DEBUG=true
ACTIONS_RUNNER_DEBUG=true
```

**Workflow Commands:**
```yaml
- run: |
    echo "::debug::Debug message"
    echo "::notice::Notice message"
    echo "::warning::Warning message"
    echo "::error::Error message"
    echo "::group::Group title"
    echo "Content"
    echo "::endgroup::"
```

### 2.2 Manage Workflow Runs

**📁 Workflows:** `15-17`

#### [15 - Workflow Caching](.github/workflows/15-caching.yml)
- ✅ Cache NPM dependencies
- ✅ Cache pip dependencies
- ✅ Cache Maven/Gradle
- ✅ Docker layer caching
- ✅ Cache best practices

**Caching Example:**
```yaml
- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-node-
```

#### [16 - Pass Data Between Jobs](.github/workflows/16-pass-data-between-jobs.yml)
- ✅ Job outputs
- ✅ Artifacts upload/download
- ✅ Environment variables (same job only)
- ✅ Cache for dependencies

**Data Passing:**
```yaml
jobs:
  job1:
    outputs:
      version: ${{ steps.version.outputs.version }}
    steps:
      - run: echo "version=1.0.0" >> $GITHUB_OUTPUT
      - uses: actions/upload-artifact@v4

  job2:
    needs: job1
    steps:
      - run: echo ${{ needs.job1.outputs.version }}
      - uses: actions/download-artifact@v4
```

#### [17 - Artifacts and Status Badges](.github/workflows/17-artifacts-badges.yml)
- ✅ Upload/download artifacts
- ✅ Artifact retention
- ✅ Status badges
- ✅ Environment protection
- ✅ Matrix deployments

**Artifacts:**
```yaml
- uses: actions/upload-artifact@v4
  with:
    name: build-artifacts
    path: dist/
    retention-days: 30
```

**Status Badge:**
```markdown
![CI](https://github.com/USER/REPO/workflows/CI/badge.svg)
```

### 2.3 Locate Workflows and Use Templates

**📁 Workflows:** `19-20`

#### [19 - Reusable Workflow](.github/workflows/19-reusable-workflow.yml)
- ✅ Define reusable workflow
- ✅ Inputs, outputs, secrets
- ✅ workflow_call trigger

#### [20 - Call Reusable Workflows](.github/workflows/20-call-reusable-workflows.yml)
- ✅ Call local reusable workflow
- ✅ Call external reusable workflow
- ✅ Pass inputs and secrets
- ✅ Use outputs from reusable workflows

**Calling Reusable Workflows:**
```yaml
jobs:
  call-workflow:
    uses: ./.github/workflows/reusable.yml
    with:
      environment: production
    secrets:
      token: ${{ secrets.DEPLOY_TOKEN }}
```

---

## Domain 3: Author and Maintain Actions (25%)

This domain covers creating and troubleshooting custom actions.

### 3.1 Action Types

**📁 Actions:** `.github/actions/`

#### [JavaScript Action](.github/actions/javascript-action/)
- ✅ Create JavaScript action
- ✅ Use Actions toolkit
- ✅ Define inputs and outputs
- ✅ Handle errors and logging

**Files:**
- `action.yml` - Metadata
- `index.js` - Implementation
- `package.json` - Dependencies

**Key Features:**
```javascript
const core = require('@actions/core');

const input = core.getInput('who-to-greet');
core.setOutput('time', new Date().toISOString());
core.setFailed('Error message');
```

#### [Docker Container Action](.github/actions/docker-action/)
- ✅ Create Dockerfile
- ✅ Write entrypoint script
- ✅ Pass arguments
- ✅ Use environment variables

**Files:**
- `action.yml` - Metadata
- `Dockerfile` - Container definition
- `entrypoint.sh` - Script

**Action Metadata:**
```yaml
runs:
  using: 'docker'
  image: 'Dockerfile'
  args:
    - ${{ inputs.task }}
```

#### [Composite Action](.github/actions/composite-action/)
- ✅ Create composite action
- ✅ Combine multiple steps
- ✅ Use other actions
- ✅ Define outputs from steps

**Composite Steps:**
```yaml
runs:
  using: 'composite'
  steps:
    - uses: actions/checkout@v4
    - shell: bash
      run: echo "Hello"
    - uses: actions/setup-node@v4
```

### 3.2 Using Custom Actions

#### [21 - Using Custom Actions](.github/workflows/21-using-custom-actions.yml)
- ✅ Use JavaScript action
- ✅ Use Docker action
- ✅ Use Composite action
- ✅ Compare action types

---

## Domain 4: Manage GitHub Actions in the Enterprise (15%)

This domain covers enterprise-level management of GitHub Actions.

### 4.1 Enterprise Management

#### [22 - Enterprise Management](.github/workflows/22-enterprise-management.yml)
- ✅ Organizational use policies
- ✅ Self-hosted runner management
- ✅ Runner groups
- ✅ IP allow lists
- ✅ Encrypted secrets scopes

**Key Topics:**

**Organizational Policies:**
- Allow all actions
- Allow GitHub + select actions
- Allow only specific actions

**Runner Scopes:**
- Repository-level runners
- Organization-level runners
- Enterprise-level runners

**Secret Scopes:**
- Environment secrets
- Repository secrets
- Organization secrets
- Enterprise secrets (with org access control)

**Runner Groups:**
- Organize by purpose/environment
- Control repository access
- Apply policies to groups

### 4.2 Workflow Templates

**📁 Templates:** `.github/workflow-templates/`

#### [Organization CI Template](.github/workflow-templates/organization-ci.yml)
- ✅ Create organization templates
- ✅ Properties file
- ✅ Template variables
- ✅ Distribution across org

**Template Structure:**
```
workflow-templates/
├── template-name.yml
└── template-name.properties.json
```

---

## Project Structure

```
gh200-exam-prep/
├── .github/
│   ├── workflows/              # 22 workflow examples
│   │   ├── 01-event-triggers-push.yml
│   │   ├── 02-event-triggers-scheduled.yml
│   │   └── ... (18 more)
│   ├── actions/                # Custom actions
│   │   ├── javascript-action/
│   │   ├── docker-action/
│   │   └── composite-action/
│   └── workflow-templates/     # Organization templates
│       └── organization-ci.yml
├── src/                        # Sample application
│   ├── index.js
│   └── test.js
├── scripts/                    # Helper scripts
│   ├── build.sh
│   ├── analyze.py
│   └── deploy.sh
├── package.json
├── README.md                   # This file
└── study-guide.md             # Official study guide
```

---

## Learning Path

### Week 1: Domain 1 - Workflows (40%)
**Day 1-2:** Event Triggers
- [ ] Study workflows 01-04
- [ ] Run each workflow
- [ ] Modify triggers and test

**Day 3-4:** Workflow Components
- [ ] Study workflows 05-09
- [ ] Create your own matrix job
- [ ] Practice job dependencies

**Day 5-7:** Specific Purposes
- [ ] Study workflows 10-14
- [ ] Set up CodeQL
- [ ] Create a release
- [ ] Practice deployment patterns

### Week 2: Domain 2 - Consume Workflows (20%)
**Day 1-2:** Caching and Data Passing
- [ ] Study workflows 15-16
- [ ] Implement caching in your workflow
- [ ] Pass data between jobs

**Day 3-4:** Artifacts and Debugging
- [ ] Study workflows 17-18
- [ ] Upload/download artifacts
- [ ] Practice debugging techniques

**Day 5-7:** Reusable Workflows
- [ ] Study workflows 19-20
- [ ] Create a reusable workflow
- [ ] Call it from another workflow

### Week 3: Domain 3 - Custom Actions (25%)
**Day 1-2:** JavaScript Actions
- [ ] Study javascript-action/
- [ ] Modify the example
- [ ] Create your own action

**Day 3-4:** Docker Actions
- [ ] Study docker-action/
- [ ] Build and test locally
- [ ] Create custom Docker action

**Day 5-7:** Composite Actions
- [ ] Study composite-action/
- [ ] Create composite action
- [ ] Combine multiple actions

### Week 4: Domain 4 - Enterprise (15%) + Review
**Day 1-2:** Enterprise Management
- [ ] Study workflow 22
- [ ] Understand runner groups
- [ ] Learn secret scopes

**Day 3-4:** Templates and Policies
- [ ] Study organization templates
- [ ] Create your own template
- [ ] Understand policies

**Day 5-7:** Final Review
- [ ] Review all workflows
- [ ] Take practice tests
- [ ] Focus on weak areas

---

## Hands-On Exercises

### Exercise 1: Create a Complete CI/CD Pipeline
Build a workflow that:
1. Triggers on push to main
2. Runs tests in a matrix (Node 18, 20)
3. Performs security scanning
4. Creates release on tag push
5. Deploys to staging/production

### Exercise 2: Build a Custom Action
Create a composite action that:
1. Sets up Node.js
2. Installs dependencies with caching
3. Runs linter and tests
4. Uploads coverage report

### Exercise 3: Implement Reusable Workflows
Create a reusable deployment workflow that:
1. Accepts environment as input
2. Downloads build artifacts
3. Deploys to specified environment
4. Runs smoke tests
5. Returns deployment URL

### Exercise 4: Enterprise Setup
Practice:
1. Setting up runner groups
2. Configuring organizational policies
3. Creating workflow templates
4. Managing secrets at different scopes

---

## Exam Tips

### Key Areas to Master

**1. Workflow Syntax (Critical)**
- YAML indentation
- Event filters (branches, paths, tags)
- Job dependencies
- Matrix strategies
- Conditionals

**2. Context Objects**
- `github.*` - Workflow context
- `secrets.*` - Secrets access
- `needs.*` - Job outputs
- `steps.*` - Step outputs
- `runner.*` - Runner information

**3. Workflow Commands**
```bash
echo "name=value" >> $GITHUB_OUTPUT   # Set output
echo "VAR=value" >> $GITHUB_ENV       # Set env var
echo "::debug::message"               # Debug
echo "::error::message"               # Error
echo "::add-mask::value"              # Mask value
```

**4. Action Types**
- JavaScript: Fast, cross-platform, uses Node.js
- Docker: Flexible, Linux only, slower startup
- Composite: Pure YAML, combines steps

**5. Runner Differences**
- GitHub-hosted: Clean, auto-scaled, minute limits
- Self-hosted: Custom, persistent, no limits

**6. Enterprise Management**
- Allowed actions policies
- Runner groups and access control
- Secret scopes (environment, repo, org)
- Workflow templates

### Common Mistakes to Avoid

❌ **Wrong:**
```yaml
- name: Set output
  run: echo "::set-output name=version::1.0"  # Deprecated
```

✅ **Correct:**
```yaml
- name: Set output
  run: echo "version=1.0" >> $GITHUB_OUTPUT
```

❌ **Wrong:**
```yaml
if: ${{ github.ref == 'main' }}  # Don't use ${{ }} in if
```

✅ **Correct:**
```yaml
if: github.ref == 'refs/heads/main'
```

❌ **Wrong:**
```yaml
needs: build
run: echo ${{ build.outputs.version }}  # Wrong context
```

✅ **Correct:**
```yaml
needs: build
run: echo ${{ needs.build.outputs.version }}
```

### Study Checklist

Before the exam, ensure you can:
- [ ] Write workflows with various event triggers
- [ ] Use matrix strategies effectively
- [ ] Implement job dependencies
- [ ] Pass data between jobs (outputs, artifacts)
- [ ] Use conditionals and expressions
- [ ] Configure caching
- [ ] Work with secrets and environment variables
- [ ] Create all three types of actions
- [ ] Troubleshoot failed workflows
- [ ] Understand runner types and selection
- [ ] Configure CodeQL scanning
- [ ] Create releases and deployments
- [ ] Set up reusable workflows
- [ ] Understand enterprise management concepts

---

## Additional Resources

### Official Documentation
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Workflow Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
- [Contexts](https://docs.github.com/en/actions/learn-github-actions/contexts)
- [Expressions](https://docs.github.com/en/actions/learn-github-actions/expressions)
- [Creating Actions](https://docs.github.com/en/actions/creating-actions)

### Microsoft Learn Paths
- [Automate your workflow with GitHub Actions](https://learn.microsoft.com/en-us/training/paths/automate-workflow-github-actions/)
- [Build CI/CD pipelines with GitHub Actions](https://learn.microsoft.com/en-us/training/modules/github-actions-ci/)

### Practice Repositories
- [GitHub Actions Samples](https://github.com/actions)
- [Starter Workflows](https://github.com/actions/starter-workflows)

### Community Resources
- [GitHub Actions Community Forum](https://github.community/c/code-to-cloud/github-actions/41)
- [Awesome Actions](https://github.com/sdras/awesome-actions)

---

## Contributing

Found an issue or want to improve this learning project? Contributions are welcome!

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

---

## License

This project is created for educational purposes to help prepare for the Microsoft GH-200 certification exam.

---

## Acknowledgments

- Microsoft for the GH-200 certification program
- GitHub for GitHub Actions platform
- The GitHub Actions community

---

## Good Luck! 🚀

Remember:
- Practice hands-on with each workflow
- Read the comments in workflow files carefully
- Experiment with modifying the examples
- Review the official study guide regularly
- Take your time to understand each concept

**You've got this!** 💪

---

**Last Updated:** January 2026

For questions or support, please open an issue in this repository.
