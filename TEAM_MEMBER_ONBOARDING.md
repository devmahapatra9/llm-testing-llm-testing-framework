# Team Member Onboarding Guide

## Add Team Members to Repository

### Step 1: Invite Team Member
```
1. Repository Settings
2. "Collaborators and teams" section
3. Click "Add people"
4. Enter their GitHub username
5. Select permission level (see below)
6. Click "Add [username]"
```

### Step 2: Choose Permission Level

**For QA Team Members**: "Write"
- Can push code
- Cannot delete repo
- Cannot change settings
- Can merge PRs

**For QA Lead**: "Maintain"
- Full access except deletion
- Can manage settings
- Can approve & merge PRs
- Cannot delete repo

**For DevOps**: "Admin"
- Full administrative access
- Can delete repo
- Can manage secrets
- Can change all settings

**For Stakeholders**: "Read"
- View-only access
- Cannot make changes
- Can see all files
- Can view discussions

### Step 3: Send Onboarding Materials

```
Send new team member:

1. QUICK_START_UAT.md
   - 5-minute quick start
   - How to run tests locally

2. TEAM_DEPLOYMENT_GUIDE.md
   - Team procedures
   - Collaboration workflow

3. GITHUB_SETUP.md
   - GitHub configuration
   - CI/CD explanation

4. This file (TEAM_MEMBER_ONBOARDING.md)
   - Complete member setup
```

---

## Team Member Setup (Step-by-Step)

### Step 1: Clone Repository
```bash
git clone https://github.com/devmahapatra9/llm-testing-llm-testing-framework.git
cd llm-testing-llm-testing-framework
```

### Step 2: Install Dependencies
```bash
python -m pip install -r requirements.txt
```

### Step 3: Configure Git
```bash
git config user.name "Team Member Name"
git config user.email "member@company.com"
```

### Step 4: Get API Key
```bash
# From team lead or GitHub secret
# Do NOT commit API key to git
$env:API_KEY = "sk-your-key"
```

### Step 5: Run Local Test
```bash
python -m robot.run tests/
```

**Expected**:
```
6 tests, 6 passed, 0 failed
```

---

## Team Member Workflow

### Daily Work:
```
1. Morning: Pull latest changes
   git pull origin main

2. Create feature branch
   git checkout -b feature/your-feature

3. Make changes (add tests, update data)

4. Test locally
   python -m robot.run tests/

5. Commit changes
   git add .
   git commit -m "Add [feature]"

6. Push to GitHub
   git push origin feature/your-feature

7. Create Pull Request on GitHub

8. Wait for review and approval

9. Merge to main
```

---

## Team Member Responsibilities

### Testing:
- [ ] Run local tests before committing
- [ ] Verify all tests pass
- [ ] Add tests for new features
- [ ] Document test cases

### Collaboration:
- [ ] Review peer PRs
- [ ] Communicate changes
- [ ] Attend team meetings
- [ ] Share knowledge

### Quality:
- [ ] Follow coding standards
- [ ] Write clear commit messages
- [ ] Keep docs updated
- [ ] Report issues promptly

---

## Pull Request Process

### Create PR:
```
1. Push feature branch to GitHub
2. Click "Compare & pull request"
3. Add title: [Type] Description
4. Add description of changes
5. Request reviewers
6. Submit PR
```

### PR Title Format:
```
[Feature] Add new test cases
[Fix] Repair accuracy validator
[Docs] Update README
[Test] Improve edge cases
```

### Team Reviews PR:
```
1. Check code quality
2. Run local tests
3. Request changes if needed
4. Approve when ready
5. Merge to main
```

### After Merge:
```
1. Delete feature branch
2. Pull latest main
3. Start next feature
```

---

## Team Member Troubleshooting

### Tests Fail Locally:
```
1. Check Python version: python --version (need 3.9+)
2. Reinstall: python -m pip install -r requirements.txt
3. Check API key: $env:API_KEY
4. Review error in results/log.html
5. Ask team lead for help
```

### Git Conflicts:
```
git fetch origin
git rebase origin/main
# Resolve conflicts in editor
git add .
git rebase --continue
git push origin feature/branch --force-with-lease
```

### Can't Push Changes:
```
Check permissions:
- Go to Settings > Collaborators
- Verify your role is "Write" or higher

If issue persists:
- Ask repository admin
- Check SSH keys or credentials
```

---

## Team Member Learning

### Phase 1 (Week 1):
- [ ] Complete onboarding
- [ ] Run local tests
- [ ] Understand folder structure
- [ ] Review test cases

### Phase 2 (Week 2):
- [ ] Create first pull request
- [ ] Add test data
- [ ] Review peer PR
- [ ] Attend team meeting

### Phase 3 (Week 3):
- [ ] Add custom test case
- [ ] Lead code review
- [ ] Update documentation
- [ ] Mentor new member

### Phase 4+ (Ongoing):
- [ ] Contribute regularly
- [ ] Mentor others
- [ ] Improve framework
- [ ] Lead initiatives

---

## Team Communication

### Daily Standup (15 min):
- What did you do?
- What will you do?
- Any blockers?

### Weekly Review (30 min):
- PR review
- Test results
- Issues & fixes
- Sprint planning

### Monthly Retrospective (1 hour):
- What went well?
- What needs improvement?
- Action items
- Next month goals

---

## Access Control Matrix

| Action | QA Member | QA Lead | DevOps | Admin |
|--------|-----------|---------|--------|-------|
| View code | ✓ | ✓ | ✓ | ✓ |
| Push code | ✓ | ✓ | ✓ | ✓ |
| Merge PR | - | ✓ | ✓ | ✓ |
| Manage secrets | - | - | ✓ | ✓ |
| Delete repo | - | - | - | ✓ |
| Change settings | - | ✓ | ✓ | ✓ |

---

## Quick Reference URLs

**Repository**: https://github.com/devmahapatra9/llm-testing-llm-testing-framework

**Clone URL**:
```
git clone https://github.com/devmahapatra9/llm-testing-llm-testing-framework.git
```

**Pull Requests**: 
```
https://github.com/devmahapatra9/llm-testing-llm-testing-framework/pulls
```

**Issues**:
```
https://github.com/devmahapatra9/llm-testing-llm-testing-framework/issues
```

**Actions**:
```
https://github.com/devmahapatra9/llm-testing-llm-testing-framework/actions
```

---

## Support

**Questions?**
- Ask team lead
- Check documentation
- Search GitHub issues
- Post in discussions

**Technical Help?**
- Run: `python -m pip install -r requirements.txt`
- Run: `python -m robot.run tests/`
- Check: `results/log.html`
- Ask: team lead

**Not Working?**
1. Force reinstall: `python -m pip install --force-reinstall -r requirements.txt`
2. Verify Python: `python --version`
3. Check API key: `$env:API_KEY`
4. Review logs: `results/log.html`
