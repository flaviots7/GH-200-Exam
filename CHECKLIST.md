# GH-200 Exam Study Checklist

## Domain 1: Author and Maintain Workflows (40%)

### Work with Events that Trigger Workflows

- [ ] Configure workflows to run for one or more events
  - [ ] Push events with branch filters
  - [ ] Pull request events
  - [ ] Path filters
  - [ ] Tag filters

- [ ] Configure workflows to run for scheduled events
  - [ ] Cron syntax
  - [ ] Multiple schedules
  - [ ] Timezone understanding

- [ ] Configure workflows to run for manual events
  - [ ] workflow_dispatch
  - [ ] Input types (choice, boolean, string)
  - [ ] Default values

- [ ] Configure workflows to run for webhook events
  - [ ] issues and issue_comment
  - [ ] release
  - [ ] deployment and deployment_status
  - [ ] check_run and check_suite
  - [ ] workflow_run

### Use the Components of a Workflow

- [ ] Identify correct syntax for workflow jobs
  - [ ] Job naming and structure
  - [ ] runs-on specification
  - [ ] Job-level environment variables
  - [ ] Timeout configuration

- [ ] Use job steps for actions and shell commands
  - [ ] uses for actions
  - [ ] run for commands
  - [ ] Shell types (bash, pwsh, python)
  - [ ] Working directory

- [ ] Use conditional keywords for steps
  - [ ] if conditions
  - [ ] Logical operators (&&, ||, !)
  - [ ] Functions: contains(), startsWith(), endsWith()
  - [ ] success(), failure(), always()

- [ ] Demonstrate use of dependent jobs
  - [ ] needs keyword
  - [ ] Multiple dependencies
  - [ ] Job outputs
  - [ ] Accessing outputs with needs context

- [ ] Identify scenarios for GitHub-hosted vs self-hosted runners
  - [ ] GitHub-hosted advantages
  - [ ] Self-hosted use cases
  - [ ] Runner labels
  - [ ] Security considerations

- [ ] Implement workflow commands as run step
  - [ ] set-output (GITHUB_OUTPUT)
  - [ ] set-env (GITHUB_ENV)
  - [ ] add-mask
  - [ ] debug, notice, warning, error
  - [ ] group/endgroup

### Use Encrypted Secrets and Environment Variables

- [ ] Use encrypted secrets to store sensitive information
  - [ ] Repository secrets
  - [ ] Organization secrets
  - [ ] Environment secrets

- [ ] Identify available default environment variables
  - [ ] GITHUB_* variables
  - [ ] RUNNER_* variables

- [ ] Identify location to set custom environment variables
  - [ ] Workflow level
  - [ ] Job level
  - [ ] Step level

- [ ] Identify when to use GITHUB_TOKEN
  - [ ] Automatic availability
  - [ ] Permissions
  - [ ] Common use cases

- [ ] Demonstrate workflow commands to set environment variables
  - [ ] echo "VAR=value" >> $GITHUB_ENV
  - [ ] Multi-line variables

### Create Workflows for Particular Purposes

- [ ] Add a script to a workflow
  - [ ] Inline scripts
  - [ ] External script files
  - [ ] Multiple shell types

- [ ] Demonstrate how to publish to GitHub Packages
  - [ ] NPM packages
  - [ ] Maven packages
  - [ ] Docker images
  - [ ] NuGet packages

- [ ] Demonstrate how to publish to GitHub Container Registry
  - [ ] Login to GHCR
  - [ ] Build and push images
  - [ ] Tag strategies

- [ ] Use database and service containers
  - [ ] Service container syntax
  - [ ] Health checks
  - [ ] Port mapping

- [ ] Use labels to route workflows to specific runners
  - [ ] Default labels
  - [ ] Custom labels
  - [ ] Label arrays

- [ ] Use CodeQL as a step in a workflow
  - [ ] Initialize CodeQL
  - [ ] Autobuild
  - [ ] Analyze
  - [ ] Custom configuration

- [ ] Demonstrate how to publish a component as a GitHub release
  - [ ] Create release
  - [ ] Upload assets
  - [ ] Generate release notes
  - [ ] Tag triggers

- [ ] Deploy a release to a cloud provider
  - [ ] Environment configuration
  - [ ] Cloud provider authentication
  - [ ] Deployment strategies

## Domain 2: Consume Workflows (20%)

### Interpret the Effects of a Workflow

- [ ] Identify the event that triggered a workflow
  - [ ] github.event_name
  - [ ] Event payload

- [ ] Describe a workflow's effects from configuration
  - [ ] Read YAML syntax
  - [ ] Understand triggers
  - [ ] Predict job execution

- [ ] Diagnose a failed workflow run
  - [ ] Read error logs
  - [ ] Identify failure points
  - [ ] Understand exit codes

- [ ] Identify ways to access workflow logs from UI
  - [ ] Actions tab
  - [ ] Workflow run details
  - [ ] Job logs

- [ ] Identify ways to access workflow logs from REST API
  - [ ] GET /repos/{owner}/{repo}/actions/runs/{run_id}/logs
  - [ ] Download logs

- [ ] Enable step debug logging
  - [ ] ACTIONS_STEP_DEBUG
  - [ ] ACTIONS_RUNNER_DEBUG

- [ ] Demonstrate use of default environment variables
  - [ ] $GITHUB_WORKSPACE
  - [ ] $GITHUB_SHA
  - [ ] $RUNNER_OS

- [ ] Demonstrate correct syntax for custom environment variables
  - [ ] Workflow, job, step levels
  - [ ] Accessing in scripts

### Manage Workflow Runs

- [ ] Configure caching of workflow dependencies
  - [ ] actions/cache
  - [ ] Cache keys
  - [ ] Restore keys
  - [ ] Cache limits

- [ ] Identify steps to pass data between jobs
  - [ ] Job outputs
  - [ ] Artifacts
  - [ ] Cache

- [ ] Remove workflow artifacts from GitHub
  - [ ] Via UI
  - [ ] Via API
  - [ ] Retention policies

- [ ] Add a workflow status badge
  - [ ] Badge syntax
  - [ ] Branch-specific badges

- [ ] Add environment protections
  - [ ] Required reviewers
  - [ ] Wait timer
  - [ ] Deployment branches

- [ ] Define a matrix of different job configurations
  - [ ] Matrix strategy
  - [ ] exclude and include
  - [ ] fail-fast

- [ ] Implement workflow approval gates
  - [ ] Environment protection rules
  - [ ] Required reviewers

### Locate Workflow, Logs, and Artifacts

- [ ] Describe where to locate a workflow
  - [ ] .github/workflows/
  - [ ] Actions tab

- [ ] Explain difference between disabling and deleting workflows
  - [ ] Disable: Temporarily stop
  - [ ] Delete: Remove file

- [ ] Demonstrate how to download workflow artifacts
  - [ ] From UI
  - [ ] Using gh CLI
  - [ ] Via API

- [ ] Describe how to use an organization's templated workflow
  - [ ] Starter workflows
  - [ ] Organization templates

## Domain 3: Author and Maintain Actions (25%)

### Use Available Action Types

- [ ] Identify the type of action required
  - [ ] JavaScript for speed
  - [ ] Docker for environment control
  - [ ] Composite for reusability

- [ ] Demonstrate how to troubleshoot JavaScript actions
  - [ ] Check dependencies
  - [ ] Review logs
  - [ ] Use debug logging

- [ ] Demonstrate how to troubleshoot Docker container actions
  - [ ] Check Dockerfile
  - [ ] Verify entrypoint
  - [ ] Test locally

### Describe the Components of an Action

- [ ] Identify files and directory structure
  - [ ] action.yml (required)
  - [ ] Source files
  - [ ] README.md

- [ ] Identify metadata and syntax
  - [ ] name, description, author
  - [ ] inputs and outputs
  - [ ] runs configuration

- [ ] Implement workflow commands within an action
  - [ ] core.setOutput()
  - [ ] core.setFailed()
  - [ ] Exit codes

## Domain 4: Manage GitHub Actions in the Enterprise (15%)

### Distribute Actions and Workflows

- [ ] Explain reuse templates for actions and workflows
  - [ ] Workflow templates
  - [ ] Reusable workflows

- [ ] Define approach for managing reusable components
  - [ ] Repository structure
  - [ ] Naming conventions
  - [ ] Version control

- [ ] Define how to distribute actions for an enterprise
  - [ ] Internal repository
  - [ ] Organization access
  - [ ] Public marketplace

- [ ] Define how to control access to actions
  - [ ] Allowed actions policies
  - [ ] Organization settings

- [ ] Configure organizational use policies
  - [ ] Allow all actions
  - [ ] Allow select actions
  - [ ] Allow specific actions

### Manage Runners for the Enterprise

- [ ] Describe effects of IP allow lists
  - [ ] GitHub-hosted runners
  - [ ] Self-hosted runners

- [ ] Describe how to select appropriate runners
  - [ ] Workload requirements
  - [ ] OS requirements
  - [ ] GitHub-hosted vs self-hosted

- [ ] Explain difference between runner types
  - [ ] Setup and maintenance
  - [ ] Scaling
  - [ ] Security

- [ ] Configure self-hosted runners
  - [ ] Installation
  - [ ] Labels
  - [ ] Proxy settings
  - [ ] Environment variables

- [ ] Demonstrate management using runner groups
  - [ ] Create groups
  - [ ] Assign runners
  - [ ] Control access
  - [ ] Move runners

- [ ] Demonstrate how to monitor and troubleshoot runners
  - [ ] Status checks
  - [ ] Logs
  - [ ] Updates

### Manage Encrypted Secrets

- [ ] Identify the scope of encrypted secrets
  - [ ] Environment
  - [ ] Repository
  - [ ] Organization

- [ ] Demonstrate how to access secrets
  - [ ] ${{ secrets.NAME }}
  - [ ] In actions
  - [ ] In workflows

- [ ] Explain how to manage organization-level secrets
  - [ ] Create secrets
  - [ ] Repository access
  - [ ] Visibility settings

- [ ] Explain how to manage repository-level secrets
  - [ ] Settings > Secrets
  - [ ] Override org secrets

---

## Study Progress

Track your progress:
- [ ] Completed all workflow examples
- [ ] Created custom JavaScript action
- [ ] Created custom Docker action
- [ ] Created custom Composite action
- [ ] Practiced with reusable workflows
- [ ] Reviewed all documentation
- [ ] Completed hands-on exercises
- [ ] Ready for exam!

---

**Tip:** Check off items as you master them. Focus on areas that remain unchecked.
