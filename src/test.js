// Simple test file for GH-200 exam project
// Demonstrates basic testing that can be run in workflows

console.log('Running tests...');

let passed = 0;
let failed = 0;

function test(description, fn) {
  try {
    fn();
    console.log(`✓ ${description}`);
    passed++;
  } catch (error) {
    console.log(`✗ ${description}`);
    console.log(`  Error: ${error.message}`);
    failed++;
  }
}

function assert(condition, message) {
  if (!condition) {
    throw new Error(message || 'Assertion failed');
  }
}

// Tests
test('Basic arithmetic', () => {
  assert(1 + 1 === 2, '1 + 1 should equal 2');
  assert(2 * 3 === 6, '2 * 3 should equal 6');
});

test('String operations', () => {
  assert('hello'.toUpperCase() === 'HELLO', 'toUpperCase works');
  assert('world'.length === 5, 'string length is correct');
});

test('Array operations', () => {
  const arr = [1, 2, 3];
  assert(arr.length === 3, 'array has correct length');
  assert(arr[0] === 1, 'first element is 1');
});

test('Environment variables', () => {
  // This test will use environment variables from workflows
  const env = process.env.NODE_ENV || 'test';
  assert(typeof env === 'string', 'environment is a string');
});

// Summary
console.log('\n=== Test Summary ===');
console.log(`Total: ${passed + failed}`);
console.log(`Passed: ${passed}`);
console.log(`Failed: ${failed}`);

if (failed > 0) {
  console.log('\n❌ Tests failed');
  process.exit(1);
} else {
  console.log('\n✅ All tests passed');
  process.exit(0);
}
