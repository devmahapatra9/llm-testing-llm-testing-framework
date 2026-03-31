# GitHub Setup & GitHub Actions Configuration

## Step 1: Add OpenAI API Key to GitHub Secrets

### Instructions:
1. Go to: **https://github.com/devmahapatra9/llm-testing-llm-testing-framework**
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Fill in:
   - **Name**: `OPENAI_API_KEY`
   - **Secret**: Your OpenAI API key (starts with `sk-`)
5. Click **Add secret**

### Verification:
```bash
# After adding the secret, GitHub Actions will use it automatically
# The workflow will decrypt it during CI/CD execution
```

---

## Step 2: Enable Scheduled Tests (Daily Runs)

The workflow is already configured to run on:
- **Push** to main branch
- **Pull requests** to main branch

To add **scheduled daily runs**, the workflow is ready. Tests will run:
- Every day at 9:00 AM UTC
- On every push to main
- On every pull request

---

## Step 3: Notifications & Alerts Setup

### GitHub Native Notifications:
1. Go to **Settings** → **Notifications**
2. Check "Workflow runs" under "Subscriptions"
3. Select notification preferences

### Slack Integration (Optional):
1. Install Slack GitHub app: https://github.com/apps/slack
2. Authorize for your repository
3. Command: `/github subscribe devmahapatra9/llm-testing-llm-testing-framework workflows`

### Email Notifications:
1. Go to **Settings** → **Notifications**
2. Set "On failure" for workflow runs
3. Set your email preferences

---

## Step 4: View CI/CD Status

### GitHub Actions Dashboard:
1. Go to your repository
2. Click **Actions** tab
3. View all workflow runs
4. Click specific run for details

### Workflow Status Badge:
Add to README.md:
```markdown
![Tests](https://github.com/devmahapatra9/llm-testing-llm-testing-framework/actions/workflows/robot-tests.yml/badge.svg)
```

---

## Step 5: Manual Workflow Trigger

Run tests manually anytime:
1. Go to **Actions** tab
2. Select **"Robot Framework Tests"** workflow
3. Click **"Run workflow"** button
4. Select branch: **main**
5. Click **"Run workflow"**

Tests will execute immediately.

---

## Environment Variables Reference

### GitHub Secrets Used:
```
OPENAI_API_KEY   → Your OpenAI API key (sk-...)
```

### Python Environment Variables:
```
API_KEY           → Used by api_client.py (set from OPENAI_API_KEY)
PYTHONPATH        → Updated for imports (auto-set)
```

---

## CI/CD Workflow Diagram

```
┌─────────────────┐
│  Push to main   │
└────────┬────────┘
         ↓
┌─────────────────────────┐
│ GitHub Actions Trigger  │
└────────┬────────────────┘
         ↓
┌─────────────────────────┐
│ Set up Python 3.9       │
└────────┬────────────────┘
         ↓
┌─────────────────────────┐
│ Install Dependencies    │
└────────┬────────────────┘
         ↓
┌─────────────────────────┐
│ Run Robot Tests         │
│ (6 test cases)          │
└────────┬────────────────┘
         ↓
┌─────────────────────────┐
│ Generate Reports        │
└────────┬────────────────┘
         ↓
┌─────────────────────────┐
│ Upload Artifacts        │
└────────┬────────────────┘
         ↓
┌─────────────────────────┐
│ GitHub Notification     │
│ (Success/Failure)       │
└─────────────────────────┘
```

---

## Troubleshooting GitHub Actions

### Workflow Won't Trigger:
- ✓ Verify secret is added
- ✓ Check branch protection rules
- ✓ Review workflow file syntax

### Tests Failing in CI:
- ✓ Check secret value
- ✓ Review logs in Actions tab
- ✓ Verify API key is valid

### Permission Denied:
- ✓ Verify workflow file permissions
- ✓ Check repository settings
- ✓ Confirm workflow is enabled

---

## GitHub Repository Settings Checklist

- [ ] Add `OPENAI_API_KEY` secret
- [ ] Enable GitHub Actions
- [ ] Configure notifications
- [ ] Add status badge to README
- [ ] Set branch protection for main
- [ ] Enable auto-merge for PRs (optional)
- [ ] Configure issue templates
- [ ] Add pull request templates

---

## Quick Commands for Local Testing Before Push

```powershell
# Test locally before pushing
cd d:\LLM

# Run with mock data (no API key)
python -m robot.run tests/

# Run with real API
$env:API_KEY = "your-key"
python -m robot.run tests/

# Verify workflow syntax (if you have act installed)
act -l
```

---

## Next: Team Rollout

See TEAM_DEPLOYMENT_GUIDE.md for:
- Team member setup
- Permission configuration
- Shared resources
- Collaboration workflows
