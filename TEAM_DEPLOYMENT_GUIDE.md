# Team Deployment & Collaboration Guide

## Overview
This guide enables your QA team to collaborate on the LLM Testing Framework.

---

## Team Member Onboarding

### Step 1: Grant Repository Access

**For GitHub Organization**:
1. Go to repository → **Settings** → **Collaborators and teams**
2. Click **Add people**
3. Enter team member email
4. Assign role:
   - **Admin**: Full control
   - **Maintain**: Manage without deletion
   - **Write**: Push code
   - **Triage**: Manage issues/PRs
   - **Read**: View only

**Recommended for QA Team**: "Write" role

### Step 2: Share Documentation

Send team members:
```
1. README.md              - Project overview
2. UAT_GUIDE.md           - How to run tests
3. QUICK_START_UAT.md     - Quick reference
4. GITHUB_SETUP.md        - CI/CD setup (this file)
5. TEAM_DEPLOYMENT_GUIDE.md - Team procedures
```

---

## Team Workflow Structure

```
┌──────────────────────────────────────────┐
│         Shared GitHub Repository         │
│  (llm-testing-llm-testing-framework)     │
└──────────────────────────────────────────┘
           ↓
    ┌──────────────────┐
    │  main branch     │  (Production)
    │  (Protected)     │
    └──────────────────┘
           ↓
    ┌──────────────────┐
    │  develop branch  │  (Staging)
    │  (Optional)      │
    └──────────────────┘
           ↓
    ┌──────────────────┐
    │ Feature branches │  (Team members)
    │ feature/XXX      │
    └──────────────────┘
```

---

## Team Member Setup (Each Team Member)

### 1. Clone Repository
```bash
git clone https://github.com/devmahapatra9/llm-testing-llm-testing-framework.git
cd llm-testing-llm-testing-framework
```

### 2. Install Dependencies
```bash
python -m pip install -r requirements.txt
```

### 3. Verify Installation
```bash
python -m robot.run --version
python -c "import openai; print('OpenAI installed')"
```

### 4. Local Configuration
```bash
# Configure git
git config user.name "Your Name"
git config user.email "your.email@company.com"

# Set up local testing
$env:API_KEY = "your-openai-api-key"

# Run local tests
python -m robot.run tests/
```

---

## Team Collaboration Workflows

### Adding New Test Cases

1. Create feature branch:
```bash
git checkout -b feature/add-new-tests
```

2. Add test file (e.g., `tests/test_performance.robot`):
```robot
*** Settings ***
Library    JSONLibrary

*** Test Cases ***
Test Response Time
    ${response}=    Get Response    Benchmark query
    Should Not Be Empty    ${response}
```

3. Test locally:
```bash
python -m robot.run tests/test_performance.robot
```

4. Commit and push:
```bash
git add tests/test_performance.robot
git commit -m "Add performance test cases"
git push origin feature/add-new-tests
```

5. Create Pull Request on GitHub
6. Team review and approval
7. Merge to main

### Updating Test Data

1. Edit `data/prompts.json`:
```json
{
  "performance": [
    {"prompt": "Quick test", "expected": "answer"},
    {"prompt": "Complex query", "expected": "detailed"}
  ]
}
```

2. Test changes:
```bash
python -m robot.run tests/
```

3. Commit and create PR

### Extending Validators

1. Update `utils/validators.py`:
```python
def is_fast_response(response_time):
    return response_time < 2.0  # 2 seconds max

def meets_quality_threshold(score):
    return score >= 0.85  # 85% quality
```

2. Test in Robot files
3. Create PR for review

---

## Code Review Process

### Pull Request Guidelines

**Title Format**:
```
[Type] Brief description (max 50 chars)

Types: [Feature] [Fix] [Docs] [Test]
```

**Description Template**:
```markdown
## Description
Brief explanation of changes

## Test Coverage
- [ ] Unit tests added
- [ ] Integration tests updated
- [ ] All tests passing locally

## Checklist
- [ ] Code follows style guide
- [ ] No hardcoded credentials
- [ ] Documentation updated
- [ ] No merge conflicts
```

### Review Checklist
- ✓ Code quality (PEP 8 for Python, RF best practices)
- ✓ Test coverage (all new code tested)
- ✓ Documentation (README/comments updated)
- ✓ No breaking changes
- ✓ Security implications reviewed
- ✓ Performance impact considered

---

## Team Communication

### Issue Tracking
Use GitHub Issues for:
- Bug reports: `[BUG] Description`
- Features: `[FEATURE] Description`
- Questions: `[QUESTION] Description`

### Discussions
Use GitHub Discussions for:
- Best practices
- Design decisions
- Knowledge sharing

### Status Updates
Weekly:
- Test pass rate
- New test cases added
- Failed tests analysis
- AI model changes

---

## Shared Resources

### Test Data Management
- **Location**: `data/prompts.json`
- **Ownership**: QA Lead
- **Update**: As needed for new scenarios
- **Versioning**: Track in git

### Documentation
- **Location**: `./*.md` files
- **Ownership**: Shared
- **Update**: When procedures change
- **Format**: Markdown

### CI/CD Configuration
- **Location**: `.github/workflows/robot-tests.yml`
- **Ownership**: DevOps/QA Lead
- **Changes**: Via Pull Request
- **Protection**: Branch protected

---

## Permission Levels

### Levels by Role:

**QA Team Members**:
- Read all files
- Push to feature branches
- Submit pull requests
- Review PRs (after training)

**QA Lead**:
- All above +
- Merge to main
- Manage issues
- Deploy to production

**DevOps**:
- All admin functions
- Workflow management
- Secret management
- Repository settings

---

## Scaling to Multiple Teams

### Multi-Team Setup

```
Org Repository (Base)
│
├── QA Team Fork/Branch
├── Dev Team Fork/Branch
└── Integration Team Fork/Branch
```

### Shared Main Repository:
- Single source of truth
- All teams contribute
- Coordinated releases

### Independent Testing:
- Each team runs own instances
- Separate test environments
- Shared test cases

---

## CI/CD for Team Collaboration

### Automatic Testing on PR:
```
Team member pushes → GitHub Actions runs → Results posted on PR
```

### Status Checks:
- All tests must pass before merge
- Code review approval required
- No conflicts with main

### Automated Notifications:
- PR: New contributions
- Failures: Test failures
- Merges: Updates to main

---

## Training & Documentation

### New Team Member Checklist:
- [ ] GitHub repository access granted
- [ ] Repository cloned locally
- [ ] Dependencies installed
- [ ] First test run successful
- [ ] Documentation reviewed
- [ ] Git workflow understood
- [ ] Team conventions learned
- [ ] Sprint assignments given

### Training Sessions:
1. **Framework Overview**: 30 min
2. **Local Setup**: 30 min
3. **Test Creation**: 1 hour
4. **CI/CD Pipeline**: 30 min
5. **Team Collaboration**: 30 min

---

## Troubleshooting for Teams

### "Permission Denied" on Push:
```bash
# Verify you have write access
git config user.name
git config user.email

# Check remote URL
git remote -v

# Fetch latest
git fetch origin
```

### "Tests Fail Locally But Pass in CI":
- Check Python version (must be 3.9+)
- Verify API_KEY environment variable
- Compare environment variables

### "Merge Conflicts":
```bash
git fetch origin
git rebase origin/main
# Resolve conflicts in editor
git rebase --continue
git push origin feature/branch --force-with-lease
```

---

## Team Performance Metrics

Track in shared dashboard:
- **Test Coverage**: % of code tested
- **Pass Rate**: % tests passing
- **Execution Time**: Minutes per run
- **Contributors**: Active team members
- **PR Velocity**: PRs merged per week
- **Bug Detection**: Bugs caught by tests

---

## Summary

Your team can now:
✅ Collaborate on code  
✅ Run automated tests  
✅ Review pull requests  
✅ Share knowledge  
✅ Scale testing  
✅ Deploy with confidence  

Next: Begin first team sprint!
