# Composite Action

A sample composite action that combines multiple steps for setting up development environments. Created for GH-200 GitHub Actions certification exam preparation.

## What is a Composite Action?

A composite action allows you to combine multiple workflow steps into a single reusable action. It's defined entirely in YAML and can include:
- Multiple steps
- Calls to other actions
- Shell commands
- Conditional logic

## Inputs

### `language`
**Required** Programming language to setup. Options: `node`, `python`, `java`. Default: `"node"`.

### `version`
**Optional** Version of the language. Default: `"20"`.

### `install-dependencies`
**Optional** Whether to install dependencies. Default: `"true"`.

### `run-tests`
**Optional** Whether to run tests. Default: `"false"`.

## Outputs

### `setup-time`
Time taken to setup the environment (in seconds).

### `status`
Status of the setup operation.

## Example usage

### Basic usage (Node.js)

```yaml
- name: Setup Node.js environment
  uses: ./.github/actions/composite-action
  with:
    language: 'node'
    version: '20'
    install-dependencies: 'true'
```

### Python with tests

```yaml
- name: Setup Python and run tests
  id: python-setup
  uses: ./.github/actions/composite-action
  with:
    language: 'python'
    version: '3.11'
    install-dependencies: 'true'
    run-tests: 'true'

- name: Display setup time
  run: echo "Setup took ${{ steps.python-setup.outputs.setup-time }}"
```

### Java environment

```yaml
- name: Setup Java
  uses: ./.github/actions/composite-action
  with:
    language: 'java'
    version: '17'
    install-dependencies: 'false'
```

## Composite Actions vs Other Action Types

### Composite Actions
- ✅ Pure YAML, no coding required
- ✅ Can use other actions
- ✅ Fast (no container build)
- ✅ Works on all runners
- ❌ Limited to what actions/shell can do
- ❌ Less control than code-based actions

### JavaScript Actions
- ✅ Full programmatic control
- ✅ Access to GitHub API via toolkit
- ✅ Fast execution
- ❌ Requires Node.js knowledge
- ❌ Need to manage dependencies

### Docker Actions
- ✅ Complete environment control
- ✅ Use any language/tool
- ❌ Slower (container build/pull)
- ❌ Linux runners only
- ❌ More complex

## When to Use Composite Actions

Use composite actions when you:
1. Want to reuse a sequence of steps across workflows
2. Need to combine multiple existing actions
3. Want to standardize common patterns (setup, build, deploy)
4. Don't need custom programming logic
5. Want cross-platform compatibility

## Composite Action Features

### Supported Step Properties
- ✅ `run` - Execute shell commands
- ✅ `uses` - Call other actions
- ✅ `if` - Conditional execution
- ✅ `shell` - Specify shell type
- ✅ `env` - Environment variables
- ✅ `working-directory` - Change directory
- ❌ `continue-on-error` - Not supported
- ❌ `timeout-minutes` - Not supported
- ❌ `strategy` - Not supported

### Outputs
- Use `${{ steps.step-id.outputs.name }}` syntax
- Outputs from internal steps can be exposed
- Define outputs in action.yml metadata

### Inputs
- Access with `${{ inputs.input-name }}`
- Support all input types: string, boolean, choice
- Can have default values
- Can be required or optional

## Best Practices

1. **Keep it focused**: One clear purpose per action
2. **Document well**: Clear descriptions for all inputs/outputs
3. **Handle errors**: Use conditionals to handle different scenarios
4. **Test thoroughly**: Test with various input combinations
5. **Version appropriately**: Use semantic versioning
6. **Use defaults**: Provide sensible default values
7. **Minimize dependencies**: Keep action simple and maintainable

## Troubleshooting

### Shell not specified error
```yaml
- shell: bash  # Always specify shell for run steps
  run: echo "Hello"
```

### Outputs not working
```yaml
# Make sure to:
# 1. Set output in step
echo "name=value" >> $GITHUB_OUTPUT

# 2. Define step id
id: my-step

# 3. Expose in outputs section of action.yml
outputs:
  my-output:
    value: ${{ steps.my-step.outputs.name }}
```

### Action not found
```yaml
# Use correct path:
# Local action in same repo:
uses: ./.github/actions/composite-action

# Action in another repo:
uses: owner/repo/.github/actions/action-name@v1
```

## Structure

```
composite-action/
├── action.yml       # Action definition (this is the only required file)
└── README.md        # Documentation
```

## Advanced Examples

### With pre/post steps

```yaml
runs:
  using: 'composite'
  steps:
    - name: Pre-action setup
      shell: bash
      run: echo "Starting..."
      
    # Main steps here
    
    - name: Post-action cleanup
      if: always()
      shell: bash
      run: echo "Cleaning up..."
```

### Using GitHub Script

```yaml
steps:
  - name: Use GitHub API
    uses: actions/github-script@v7
    with:
      script: |
        const issue = await github.rest.issues.create({
          owner: context.repo.owner,
          repo: context.repo.repo,
          title: 'Created by composite action'
        });
```

## Learn More

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Creating Composite Actions](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action)
- [Metadata Syntax](https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions)
