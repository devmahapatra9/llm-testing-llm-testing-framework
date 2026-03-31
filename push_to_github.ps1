# Git Push Script for LLM Testing Framework
# Run this after installing Git and creating the GitHub repository

Write-Host "Initializing Git repository..."
git init

Write-Host "Adding all files..."
git add .

Write-Host "Committing changes..."
git commit -m "Initial commit for LLM Testing Framework"

Write-Host "Adding remote repository..."
git remote add origin https://github.com/devmahapatra9/llm-testing-llm-testing-framework.git

Write-Host "Pushing to GitHub..."
git push -u origin main

Write-Host "Push complete! Check your GitHub repository."
