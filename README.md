# LLM Testing Framework

## Overview
This project provides a comprehensive testing framework for Large Language Models (LLMs) using Python and Robot Framework. It automates testing for accuracy, safety, and edge cases to ensure reliable AI responses.

## Features
- Automated API testing for OpenAI models
- Validation functions for response quality
- Robot Framework test suites for different scenarios
- Configurable prompts and test data
- Error handling and logging

## Tech Stack
- Python 3.x
- Robot Framework
- OpenAI API
- JSON for data handling

## Setup Instructions
1. Clone the repository
2. Install dependencies: `pip install -r requirements.txt`
3. Set your OpenAI API key: `set API_KEY=your_api_key_here`
4. Run tests: `robot tests/`

## How to Run Tests

### Mock Mode (No API Key)
For local development and testing without OpenAI API:
```bash
python -m robot.run tests/
```

### User Acceptance Testing (With Real API)
To run against real ChatGPT API:
```powershell
.\run_uat.ps1 -ApiKey "your_openai_api_key"
```

### Individual Tests
```bash
# Test accuracy only
python -m robot.run tests/test_accuracy.robot

# Test safety only
python -m robot.run tests/test_safety.robot

# Test edge cases only
python -m robot.run tests/test_edge_cases.robot

# With detailed output
python -m robot.run --outputdir results tests/
```

## Use Cases
- Quality assurance for LLM integrations
- Regression testing for AI models
- Safety compliance checks
- Performance benchmarking

## User Acceptance Testing (UAT)
This framework includes automated UAT capabilities:

1. **Local UAT**: Run `run_uat.ps1` with your OpenAI API key
2. **CI/CD UAT**: Automated testing on GitHub with real API
3. **Comprehensive Reports**: HTML, XML, and detailed logs
4. **See UAT_GUIDE.md** for complete step-by-step instructions

## CI/CD Pipeline
This project includes a GitHub Actions workflow that automatically runs Robot Framework tests on every push to the main/master branch and on pull requests.

### Setting up CI/CD:
1. Go to your GitHub repository Settings > Secrets and variables > Actions
2. Add a new repository secret named `OPENAI_API_KEY` with your OpenAI API key
3. The workflow will automatically run tests on each push
4. Tests run against real ChatGPT API in CI/CD environment

### Workflow Details:
- Runs on Ubuntu with Python 3.9
- Installs all dependencies from `requirements.txt`
- Executes all Robot Framework tests against OpenAI API
- Validates accuracy, safety, and edge cases
- Uploads test results as artifacts for review

## Project Structure
- `tests/`: Robot Framework test files
- `utils/`: Python utility modules
- `data/`: Test data and prompts
- `requirements.txt`: Python dependencies
- `README.md`: This file
- `.gitignore`: Git ignore rules
