const core = require('@actions/core');
const github = require('@actions/github');

async function run() {
  try {
    // Get inputs
    const nameToGreet = core.getInput('who-to-greet', { required: true });
    const greeting = core.getInput('greeting');
    const loudly = core.getInput('loudly') === 'true';
    
    // Log inputs
    console.log(`Greeting ${nameToGreet}!`);
    
    // Create greeting message
    let message = `${greeting}, ${nameToGreet}!`;
    if (loudly) {
      message = message.toUpperCase();
    }
    
    // Log the greeting
    core.info(message);
    
    // Get current time
    const time = new Date().toISOString();
    
    // Set outputs
    core.setOutput('time', time);
    core.setOutput('message', message);
    
    // Example: Working with GitHub context
    const context = github.context;
    core.info(`Repository: ${context.repo.owner}/${context.repo.repo}`);
    core.info(`Event: ${context.eventName}`);
    core.info(`SHA: ${context.sha}`);
    
    // Example: Create a notice
    core.notice('This is a JavaScript action example for GH-200 exam preparation');
    
    // Example: Group output
    core.startGroup('Additional Information');
    console.log('Node version:', process.version);
    console.log('Platform:', process.platform);
    console.log('Architecture:', process.arch);
    core.endGroup();
    
    // Example: Set environment variable
    core.exportVariable('GREETING_MESSAGE', message);
    
    // Example: Add to PATH (if needed)
    // core.addPath('/custom/path');
    
    // Example: Set secret (mask value in logs)
    if (process.env.SENSITIVE_VALUE) {
      core.setSecret(process.env.SENSITIVE_VALUE);
    }
    
    console.log('Action completed successfully!');
    
  } catch (error) {
    // Set the action as failed with error message
    core.setFailed(error.message);
    
    // Log error with additional context
    core.error(`Action failed: ${error.message}`);
    
    // You can also use:
    // core.warning('This is a warning message');
    // core.debug('This is a debug message');
  }
}

// Run the action
run();
