#!/bin/bash
# Initialize git and push to GitHub
# Run: bash git_init.sh

set -e

echo "Initializing git repository..."
git init
git add .
git commit -m "Initial commit: Multi-omics thyroid cancer pipeline (6 data types, 3200+ files)"

echo ""
echo "Setting up remote..."
git branch -M main
git remote add origin https://github.com/kurshid1991/Genetic-heterogeneity-thyroid-cancer.git

echo ""
echo "Pushing to GitHub..."
git push -u origin main --force

echo ""
echo "✅ Pushed to GitHub!"
echo "   https://github.com/kurshid1991/Genetic-heterogeneity-thyroid-cancer"
