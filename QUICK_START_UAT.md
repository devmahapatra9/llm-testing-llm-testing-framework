# Quick Start - User Acceptance Testing

## Complete UAT Execution (One Command)

```powershell
cd d:\LLM
.\run_uat.ps1 -ApiKey "sk-your-actual-openai-api-key"
```

## What Gets Tested

### ✅ Accuracy Tests
- Capital of France → Expects: "paris" or "france"
- Romeo & Juliet Author → Expects: "shakespeare"

### ✅ Safety Tests
- Harmful prompts (bomb-making, hacking) → Rejects/defuses

### ✅ Edge Case Tests
- Empty prompt → Handles gracefully
- Ambiguous prompt → Responds appropriately  
- Special characters → Processes safely

## Expected Output

```
==============================================================================
Tests
==============================================================================
Tests.Test Accuracy
==============================================================================
Test Capital of France                                           | PASS |
Test Romeo and Juliet Author                                     | PASS |
Tests.Test Edge Cases
==============================================================================
Test Empty Prompt                                                | PASS |
Test Ambiguous Prompt                                            | PASS |
Test Unexpected Input                                            | PASS |
Tests.Test Safety
==============================================================================
Test Safety                                                      | PASS |
==============================================================================
Tests                                                            | PASS |
5 tests, 5 passed, 0 failed
==============================================================================
```

## Report Locations
- **HTML Report**: `results/report.html` (open in browser)
- **Log Details**: `results/log.html` (full execution trace)
- **XML Data**: `results/output.xml` (for CI/CD systems)

## Step-by-Step Execution

1. **Get API Key**
   - Go to https://platform.openai.com/api-keys
   - Create new secret key
   - Copy the key (starts with `sk-`)

2. **Open PowerShell**
   ```powershell
   cd d:\LLM
   ```

3. **Run UAT**
   ```powershell
   .\run_uat.ps1 -ApiKey "sk-your-key-here"
   ```

4. **Wait for completion** (2-3 minutes typical)

5. **Check results**
   - View `results/report.html` in browser
   - Verify all 5 tests pass
   - If any fail, check `results/log.html` for details

## Troubleshooting

### Test Fails on Accuracy
- Real ChatGPT responses may vary from expected format
- Check `results/log.html` to see actual vs. expected response
- Validator checks for keyword presence (case-insensitive)

### API Key Error
```powershell
$env:API_KEY = "sk-your-key"
[Environment]::GetEnvironmentVariable('API_KEY')
```

### Rate Limit Hit
- Wait 60 seconds and rerun
- OpenAI has rate limits on free tier

### Python/Robot Not Found
- Reinstall: `python -m pip install -r requirements.txt`
- Check Python: `python --version` (should be 3.9+)

## Files Involved

```
d:\LLM\
├── run_uat.ps1                 ← Main UAT script
├── utils\
│   ├── api_client.py           ← OpenAI API wrapper
│   └── validators.py           ← Response validators
├── tests\
│   ├── test_accuracy.robot     ← Accuracy tests
│   ├── test_safety.robot       ← Safety tests
│   └── test_edge_cases.robot   ← Edge case tests
├── data\
│   └── prompts.json            ← Test prompts
├── requirements.txt            ← Python dependencies
└── results\                     ← UAT output (generated)
    ├── report.html
    ├── log.html
    └── output.xml
```

## Success Criteria

✅ **UAT Passes When:**
- All 5 tests show PASS status
- 0 tests failed
- Total tests = 5 passed, 0 failed
- No Python errors in log

## Next Steps After UAT
1. **Review Reports**: Open `results/report.html`
2. **Analyze Logs**: Check `results/log.html` for details
3. **Push to GitHub**: `git push` to trigger CI/CD
4. **Monitor CI/CD**: GitHub Actions runs same tests automatically
