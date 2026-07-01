# JavaScript Greeting Action

A sample JavaScript action demonstrating GitHub Actions development for the GH-200 certification exam.

## Inputs

### `who-to-greet`
**Required** The person to greet. Default: `"World"`.

### `greeting`
**Optional** The greeting message. Default: `"Hello"`.

### `loudly`
**Optional** Whether to shout the greeting (uppercase). Default: `"false"`.

## Outputs

### `time`
The time when the greeting was made (ISO 8601 format).

### `message`
The complete greeting message.

## Example usage

```yaml
- name: Greet someone
  id: greeter
  uses: ./.github/actions/javascript-action
  with:
    who-to-greet: 'Alice'
    greeting: 'Good morning'
    loudly: 'false'

- name: Display greeting
  run: |
    echo "Time: ${{ steps.greeter.outputs.time }}"
    echo "Message: ${{ steps.greeter.outputs.message }}"
```

## Development

To work with this action:

1. Install dependencies:
   ```bash
   npm install
   ```

2. Test locally (requires a workflow to call it)

3. Commit node_modules or use @vercel/ncc to bundle:
   ```bash
   npm install -g @vercel/ncc
   ncc build index.js -o dist
   ```

## Action Types

This is a **JavaScript action** that:
- Runs directly on the runner
- Uses Node.js 20
- Has access to GitHub Actions toolkit
- Is faster than Docker container actions
- Works on all GitHub-hosted runners

## Troubleshooting

If the action fails:
1. Check action logs in the workflow run
2. Enable debug logging: Set `ACTIONS_STEP_DEBUG=true`
3. Verify all required inputs are provided
4. Check Node.js version compatibility
