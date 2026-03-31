# GitHub Secret Setup - Step by Step

## Add OPENAI_API_KEY to GitHub Secrets

### Step 1: Navigate to Settings
```
1. Go to https://github.com/devmahapatra9/llm-testing-llm-testing-framework
2. Click "Settings" tab (top right)
3. Left menu: Click "Secrets and variables"
4. Click "Actions"
```

### Step 2: Create New Secret
```
1. Click "New repository secret" button (green)
2. Name field: Type exactly: OPENAI_API_KEY
3. Secret field: Paste your API key (sk-...)
4. Click "Add secret"
```

### Step 3: Verify Secret Added
```
✓ You should see OPENAI_API_KEY listed
✓ It shows as [Updated recently]
✓ The value is hidden (shows as dots)
```

### Step 4: Test the Secret
```
1. Go to "Actions" tab
2. Select "Robot Framework Tests"
3. Click "Run workflow"
4. Watch it execute using the secret
```

---

## GitHub Secret for Multiple Team Members

### If Using Organization:
```
1. Only admins can add secrets
2. Admins add to organization
3. All repos can access it
4. Individual repos can add repo-specific secrets
```

### If Using Personal Account:
```
1. You add the secret
2. Share repo access with team
3. They can see workflows use the secret
4. But they can't see the secret value
```

---

## Troubleshooting Secrets

### Secret Not Working:
```
✓ Verify name is exactly: OPENAI_API_KEY
✓ Check API key format (starts with sk-)
✓ Confirm key is still valid
✓ Re-run workflow manually
```

### Still Failing:
```
1. Regenerate API key at OpenAI
2. Update secret value
3. Re-run workflow
4. Check logs for errors
```

### Best Practices:
```
✓ Never commit API keys to git
✓ Never share secret value
✓ Rotate keys quarterly
✓ Use different keys for dev/prod
✓ Monitor API key usage
```

---

## GitHub Actions Status Check

View your workflow:
```
https://github.com/devmahapatra9/llm-testing-llm-testing-framework/actions

Status colors:
🟢 Completed successfully
🔴 Failed
🟡 In progress
⚪ Queued
```

---

## GitHub Secret Rotation

### Every Quarter:
```
1. Generate new API key at OpenAI
2. Update GitHub secret
3. Delete old key
4. Re-run tests to verify
5. Document change
```

### Emergency Rotation:
```
If key compromised:
1. Delete key immediately at OpenAI
2. Generate new key
3. Update GitHub secret
4. Monitor for abuse
5. File incident report
```
