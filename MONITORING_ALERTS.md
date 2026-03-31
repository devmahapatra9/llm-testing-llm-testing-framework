# Monitoring & Alerts Configuration

## GitHub Actions Monitoring

### View Test Status
```
1. Repository → Actions tab
2. Select "Robot Framework Tests" workflow
3. View all runs (with dates/times)
4. Click specific run to see details
5. Check job logs for troubleshooting
```

### Real-Time Monitoring
```
Red icon:     ❌ Test failed
Green icon:   ✅ Test passed
Yellow icon:  🟡 Test running
Gray icon:    ⚪ Test pending
```

---

## Setting Up Notifications

### Email Notifications

**GitHub Default**:
```
1. Settings → Notifications
2. Check "Workflows" 
3. Select "On failure"
4. Verify email address
```

**Result**: Get email when tests fail

### Browser Notifications

**In GitHub**:
```
1. Top right: Bell icon
2. Click for dropdown
3. Select notification preferences
4. Choose: Participating or All
```

### Slack Integration (Enterprise)

**Setup**:
```
1. Go to: https://slack.com/apps
2. Search: GitHub
3. Click: "Install" or "Open in Slack"
4. Authorize the app
5. Subscribe to workflows
```

**Subscribe Command**:
```
/github subscribe owner/repo workflows:*
```

**Example Slack Alert**:
```
[GitHub] LLM Testing Framework
✅ All tests passed!
- Accuracy: 2/2
- Safety: 1/1
- Edge Cases: 3/3
Branch: main | Run time: 2:30
```

---

## Custom Monitoring Dashboard

### Create Manual Tracking Spreadsheet

**Columns**:
```
Date | Pass Rate | #Tests | #Passed | #Failed | Duration | Notes
```

### Weekly Report Template

```markdown
## Weekly Report - Week of [Date]

### Summary
- Pass Rate: 100%
- Avg Duration: 2:30
- Total Runs: 7
- Failures: 0

### Test Breakdown
- Accuracy: 2/2 ✓
- Safety: 1/1 ✓
- Edge Cases: 3/3 ✓

### Incidents
None

### Next Week
- Add new test cases
- Optimize performance
```

---

## Alert Thresholds

### Set Alerts for:
```
✓ Any test failure
✓ Execution time > 5 minutes
✓ API errors
✓ Integration failures
✓ Performance degradation
```

### Response Times:
```
Critical (all fail):   Immediate (5 min)
High (some fail):      30 minutes
Medium (flaky):        Same day
Low (warnings):        Next sprint
```

---

## Monitoring Metrics

### Track These:
```
Daily:
- Test pass rate
- Execution time
- API success rate

Weekly:
- Trend analysis
- Coverage changes
- New test additions

Monthly:
- Performance trends
- API usage
- Team velocity
```

---

## Automated Status Checks

### Add to README.md Status Badge:

```markdown
## Status

[![Tests](https://github.com/devmahapatra9/llm-testing-llm-testing-framework/actions/workflows/robot-tests.yml/badge.svg)](https://github.com/devmahapatra9/llm-testing-llm-testing-framework/actions)
```

Shows:
```
✅ Passing
❌ Failing
🟡 In Progress
```

---

## Grafana/DataDog (Enterprise)

### Export XML Results:
```
results/output.xml can be parsed by:
- Grafana
- DataDog
- Elastic
- Splunk
- CloudWatch
```

### Setup Integration:
1. Get `output.xml` from each run
2. Parse and extract metrics
3. Send to monitoring platform
4. Create dashboards
5. Set alerts

---

## Performance Tracking

### Monitor Execution Time

```
Target:  < 3 minutes
Warning: > 4 minutes
Critical: > 5 minutes
```

### Track Per Test:
```
Test Setup:        0:05
Accuracy Tests:    0:45
Safety Tests:      0:30
Edge Case Tests:   0:45
Reporting:         0:05
Total:            2:10
```

---

## API Usage Monitoring

### Track OpenAI API Calls:
```
Daily limit: 100 calls (adjust per plan)
Monitor:
- Calls per day
- Cost per day
- Response times
- Error rates
```

### Alert on High Usage:
```
If calls > 80% of limit → Alert team
If calls > 95% of limit → Escalate
If cost > budget → Stop tests
```

---

## Incident Management

### Create Incident Log:
```
Date     | Issue | Severity | Duration | Resolution
---------|-------|----------|----------|------------
3/31/26  | Test X failed | High | 2 hours | Fixed validator
```

### Post-Incident Review:
```
1. What happened?
2. Why did it happen?
3. How was it fixed?
4. How to prevent?
5. Action items
```

---

## Weekly Operations Checklist

- [ ] Review test results
- [ ] Check for failures
- [ ] Verify API usage
- [ ] Update metrics
- [ ] Address any issues
- [ ] Plan next sprint
- [ ] Review performance

---

## Monthly Operations Review

- [ ] Trend analysis
- [ ] Performance improvements
- [ ] Test coverage growth
- [ ] Team feedback
- [ ] Plan next quarter
- [ ] Update thresholds
- [ ] Celebrate wins
