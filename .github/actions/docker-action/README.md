# Docker Container Action

A sample Docker container action demonstrating GitHub Actions development for the GH-200 certification exam.

## Inputs

### `task`
**Required** The task to perform. Options: `analyze`, `build`, `test`. Default: `"analyze"`.

### `target`
**Optional** Target file or directory. Default: `"."`.

### `verbose`
**Optional** Enable verbose output. Default: `"false"`.

## Outputs

### `result`
The result of the operation.

### `exit-code`
The exit code of the operation (0 for success, non-zero for failure).

## Example usage

```yaml
- name: Run Docker action
  id: docker-task
  uses: ./.github/actions/docker-action
  with:
    task: 'analyze'
    target: './src'
    verbose: 'true'

- name: Display result
  run: |
    echo "Result: ${{ steps.docker-task.outputs.result }}"
    echo "Exit code: ${{ steps.docker-task.outputs.exit-code }}"
```

## Docker Container Actions

This is a **Docker container action** that:
- Runs inside a Docker container
- Has full control over the environment
- Can use any language or tools
- Is more portable across different environments
- Takes longer to start than JavaScript actions
- Only works on Linux runners (GitHub-hosted or self-hosted)

## Development

To test this action locally:

1. Build the Docker image:
   ```bash
   docker build -t docker-action .
   ```

2. Run the container:
   ```bash
   docker run --rm \
     -e GITHUB_REPOSITORY=test/repo \
     -e GITHUB_WORKFLOW=test \
     docker-action analyze . true
   ```

## Files Structure

```
docker-action/
├── action.yml       # Action metadata
├── Dockerfile       # Container definition
├── entrypoint.sh    # Main script
└── README.md        # This file
```

## Advantages of Docker Actions

1. **Consistency**: Same environment everywhere
2. **Flexibility**: Use any language or tool
3. **Isolation**: Doesn't affect the runner
4. **Portability**: Works across different systems

## Disadvantages

1. **Performance**: Slower to start (build/pull image)
2. **Linux only**: Won't work on Windows/macOS runners
3. **Size**: Docker images can be large
4. **Complexity**: More moving parts than JavaScript actions

## Troubleshooting

### Action fails to build
- Check Dockerfile syntax
- Verify base image is accessible
- Ensure all COPY paths exist

### Entrypoint script errors
- Verify script has execute permissions
- Check shebang line is correct
- Ensure line endings are Unix (LF, not CRLF)

### Environment variables not available
- Make sure you're using `$GITHUB_*` variables
- Check that inputs are being passed correctly
- Verify args in action.yml match entrypoint expectations

## Best Practices

1. Use specific base image versions (not `latest`)
2. Minimize layer count for faster builds
3. Use `.dockerignore` to exclude unnecessary files
4. Keep images small (use Alpine when possible)
5. Don't store secrets in the image
6. Make entrypoint scripts executable in Dockerfile
