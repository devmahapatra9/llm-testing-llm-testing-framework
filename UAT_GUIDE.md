# User Acceptance Test Guide

## Overview
This guide walks you through running the LLM Testing Framework against real OpenAI ChatGPT API for full User Acceptance Testing (UAT).

## Prerequisites
1. **OpenAI API Key**: Get one from https://platform.openai.com/api-keys
2. **Python 3.9+**: Already installed on your system
3. **Git**: For version control
4. **Project Files**: All files are in `d:\LLM`

## Step 1: Set Up Your OpenAI API Key
Get your API key from OpenAI:
```
1. Go to https://platform.openai.com/api-keys
2. Click "Create new secret key"
3. Copy the key (you'll use it in the test)
```

## Step 2: Run the UAT Suite
Open PowerShell and execute:

```powershell
cd d:\LLM
.\run_uat.ps1 -ApiKey "sk-your-actual-api-key-here"
```

Replace `sk-your-actual-api-key-here` with your real OpenAI API key.

## Step 3: Monitor Test Execution
The script will:
1. ✓ Set up the environment
2. ✓ Verify Python and Robot Framework
3. ✓ Install all dependencies
4. ✓ Run tests against real ChatGPT API
5. ✓ Generate detailed reports

## Step 4: Review Test Reports
After execution, check the results:

```
results/report.html  → Human-readable test report
results/log.html     → Detailed test logs
results/output.xml   → Machine-readable results
```

## Test Cases Executed

### Test Accuracy (test_accuracy.robot)
- **Test Capital of France**: Validates ChatGPT correctly identifies Paris as France's capital
- **Test Romeo and Juliet Author**: Validates ChatGPT correctly identifies Shakespeare as the author

### Test Safety (test_safety.robot)
- **Test Safety**: Ensures ChatGPT refuses harmful prompts (bomb-making, hacking)

### Test Edge Cases (test_edge_cases.robot)
- **Test Empty Prompt**: Handles empty input gracefully
- **Test Ambiguous Prompt**: Manages vague requests properly
- **Test Unexpected Input**: Processes special characters correctly

## Expected Results
- **All tests should PASS** when running against real API
- Tests validate:
  - ✓ Factual accuracy of responses
  - ✓ Safety guardrails working
  - ✓ Edge case handling
  - ✓ Empty/malformed input management

## Troubleshooting

### API Key Not Found
```powershell
$env:API_KEY = "your-key-here"
Get-ChildItem env:API_KEY
```

### Rate Limiting
If you get rate limit errors, wait a few minutes and rerun.

### Test Failures
Check `results/log.html` for detailed error messages.

## Advanced: Manual Testing
Run individual test files:

```powershell
# Test accuracy only
python -m robot.run --outputdir results tests/test_accuracy.robot

# Test safety only
python -m robot.run --outputdir results tests/test_safety.robot

# Test edge cases only
python -m robot.run --outputdir results tests/test_edge_cases.robot
```

## CI/CD Integration
This framework is also configured for GitHub Actions. When you push to GitHub:
1. GitHub Actions automatically runs the test suite
2. OpenAI API key stored as GitHub Secret (`OPENAI_API_KEY`)
3. Tests run automatically on every push
4. Results available in GitHub Actions tab
