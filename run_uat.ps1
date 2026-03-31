# LLM Testing Framework - User Acceptance Test (UAT) Runner
# This script runs the complete framework against real ChatGPT/OpenAI API
# Usage: .\run_uat.ps1 -ApiKey "your_openai_api_key"

param(
    [Parameter(Mandatory=$true)]
    [string]$ApiKey
)

Write-Host "================================"
Write-Host "LLM Testing Framework - UAT"
Write-Host "================================"
Write-Host ""

# Set up environment
Write-Host "[1/5] Setting up environment..."
$env:API_KEY = $ApiKey
Write-Host "✓ API_KEY environment variable set"
Write-Host ""

# Verify dependencies
Write-Host "[2/5] Verifying dependencies..."
$pythonVersion = python --version 2>&1
Write-Host "✓ Python: $pythonVersion"

$robotVersion = python -m robot.run --version 2>&1
Write-Host "✓ Robot Framework: $robotVersion"
Write-Host ""

# Install/update requirements
Write-Host "[3/5] Installing requirements..."
python -m pip install -q -r requirements.txt
Write-Host "✓ All dependencies installed"
Write-Host ""

# Run test suite with verbose output
Write-Host "[4/5] Executing test suite against OpenAI API..."
Write-Host "Running: python -m robot.run --outputdir results tests/"
Write-Host ""

python -m robot.run --outputdir results tests/

Write-Host ""
Write-Host "[5/5] UAT Complete!"
Write-Host "================================"
Write-Host "Test reports:"
Write-Host "  - HTML Report: results\report.html"
Write-Host "  - Test Log:    results\log.html"
Write-Host "  - XML Output:  results\output.xml"
Write-Host "================================"
