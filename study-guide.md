# Domain 1: Author and maintain workflows (40%)
## Work with events that trigger workflows
### Configure workflows to run for one or more events
### Configure workflows to run for scheduled events
### Configure workflows to run for manual events
### Configure workflows to run for webhook events (e.g., check_run, check_suite, deployment, etc.)
### Demonstrate a GitHub event to trigger a workflow based on a practical use case

## Use the components of a workflow
### Identify the correct syntax for workflow jobs (e.g., indentation and encapsulation of parts of the workflow)
### Use job steps for actions and shell commands
### Use conditional keywords for steps
### Describe how actions, workflows, jobs, steps, runs, and the marketplace work together
### Identify scenarios suited for using GitHub-hosted and self-hosted runners
### Implement workflow commands as a run step to communicate with the runner
### Demonstrate the use of dependent jobs

## Use encrypted secrets and environment variables as part of a workflow
### Use encrypted secrets to store sensitive information
### Identify the available default environment variables during the construction of the workflow
### Identify the location to set custom environment variables in a workflow
### Identify when to use the GITHUB_TOKEN secret
### Demonstrate how to use workflow commands to set environment variables

## Create a workflow for a particular purpose
### Add a script to a workflow

### Demonstrate how to publish to GitHub Packages using a workflow

### Demonstrate how to publish to GitHub Container Registry using a workflow

### Use database and service containers in a GitHub Actions workflow

### Use labels to route workflows to specific runners

### Use CodeQL as a step in a workflow

### Demonstrate how to publish a component as a GitHub release using GitHub Actions

### Deploy a release to a cloud provider using a GitHub Actions workflow




# Domain 2: Consume workflows (20%)
## Interpret the effects of a workflow
### Identify the event that triggered a workflow from its effects in a repository, issue, or pull request

### Describe a workflow’s effects from reading its configuration file

### Diagnose a failed workflow run (e.g., using a workflow run history and its logs, determine why a workflow run may have failed)

### Identify ways to access the workflow logs from the user interface

### Identify ways to access the workflow logs from GitHub’s REST API

### Enable step debug logging in a workflow

### Demonstrate how to use default environment variables in a workflow

### Demonstrate the correct syntax for passing custom environment variables in a workflow step

## Manage workflow runs
Configure caching of workflow dependencies

### Identify steps to pass data between jobs in a workflow

### Remove workflow artifacts from GitHub

### Add a workflow status badge

### Add environment protections

### Define a matrix of different job configurations

### Implement workflow approval gates

## Locate a workflow, its logs, and artifacts
### Describe where to locate a workflow in a repository

### Explain the difference between disabling and deleting of workflows

### Demonstrate how to download workflow artifacts from the user interface

### Describe how to use an organization’s templated workflow






# Domain 3: Author and maintain actions (25%)
## Use available action types
### Identify the type of action required for a given problem (e.g., JavaScript, Docker container, run step)

### Demonstrate how to troubleshoot JavaScript actions

### Demonstrate how to troubleshoot Docker container actions

## Describe the components of an action
### Identify the files and directory structure needed to create an action

### Identify the metadata and syntax needed to create an action

### Implement workflow commands within an action to communicate with the runner (Note: this includes exit codes)




# Domain 4: Manage GitHub Actions in the enterprise (15%)
## Distribute actions and workflows to the enterprise
### Explain reuse templates for actions and workflows

### Define an approach for managing and leveraging reusable components (e.g., repos for storage, naming conventions for files/folders, and plans for ongoing maintenance)

### Define how to distribute actions for an enterprise

### Define how to control access to actions within the enterprise

### Configure organizational use policies for GitHub Actions

## Manage runners for the enterprise
### Describe the effects of configuring IP allow lists on GitHub-hosted and self-hosted runners

### Describe how to select appropriate runners to support workloads (e.g., using a self-hosted versus GitHub-hosted runner, choosing supported operating systems)

### Explain the difference between GitHub-hosted and self-hosted runners

### Configure self-hosted runners for enterprise use (e.g., including proxies, labels, networking)

### Demonstrate how to manage self-hosted runners using groups (e.g., managing access, moving runners into and between groups)

### Demonstrate how to monitor, troubleshoot, and update self-hosted runners

## Manage encrypted secrets in the enterprise
### Identify the scope of encrypted secrets

### Demonstrate how to access encrypted secrets within actions and workflows

### Explain how to manage organization-level encrypted secrets

### Explain how to manage repository-level encrypted secrets

