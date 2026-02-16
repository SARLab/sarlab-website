#!/bin/bash

# SARLab Website Deployment Setup Script
# This script helps set up GitHub repository and deploy the website

set -e

echo "🚀 SARLab Website Deployment Setup"
echo "==================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo -e "${RED}❌ GitHub CLI (gh) is not installed.${NC}"
    echo ""
    echo "To install GitHub CLI:"
    echo "  macOS:    brew install gh"
    echo "  Ubuntu:   sudo apt install gh"
    echo "  Windows:  winget install --id GitHub.cli"
    echo ""
    echo "Or download from: https://cli.github.com/"
    exit 1
fi

# Check if user is authenticated
echo "🔍 Checking GitHub authentication..."
if ! gh auth status &> /dev/null; then
    echo -e "${YELLOW}⚠️  Not authenticated with GitHub.${NC}"
    echo ""
    echo "Please run: gh auth login"
    echo ""
    echo "This will open a browser to authenticate. Choose:"
    echo "  - GitHub.com"
    echo "  - HTTPS"
    echo "  - Login with a web browser"
    exit 1
fi

echo -e "${GREEN}✅ GitHub CLI authenticated${NC}"
echo ""

# Get GitHub username
GITHUB_USER=$(gh api user -q .login)
echo "👤 GitHub User: $GITHUB_USER"
echo ""

# Ask for repository name
read -p "📁 Repository name (default: sarlab-website): " REPO_NAME
REPO_NAME=${REPO_NAME:-sarlab-website}

# Ask if repository should be public or private
read -p "🔒 Make repository private? (y/N): " PRIVATE_ANSWER
if [[ $PRIVATE_ANSWER =~ ^[Yy]$ ]]; then
    REPO_VISIBILITY="--private"
    VISIBILITY_TEXT="private"
else
    REPO_VISIBILITY="--public"
    VISIBILITY_TEXT="public"
fi

echo ""
echo "📋 Setup Summary:"
echo "  Repository: $REPO_NAME"
echo "  Visibility: $VISIBILITY_TEXT"
echo "  URL: https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""

read -p "Continue? (Y/n): " CONFIRM
if [[ $CONFIRM =~ ^[Nn]$ ]]; then
    echo "Cancelled."
    exit 0
fi

echo ""
echo "🔧 Creating repository..."

# Create repository
cd "$(dirname "$0")"

# Check if git is initialized
if [ ! -d .git ]; then
    git init
    git branch -m main
fi

# Create repository on GitHub
gh repo create "$REPO_NAME" $REPO_VISIBILITY --source=. --remote=origin --push

echo -e "${GREEN}✅ Repository created!${NC}"
echo ""

# Enable GitHub Pages
echo "📄 Enabling GitHub Pages..."
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  /repos/$GITHUB_USER/$REPO_NAME/pages \
  -f source='{"branch":"main","path":"/"}' || true

echo -e "${GREEN}✅ GitHub Pages enabled!${NC}"
echo ""

# Get Pages URL
PAGES_URL="https://$GITHUB_USER.github.io/$REPO_NAME"
if [ "$VISIBILITY_TEXT" = "private" ]; then
    echo -e "${YELLOW}⚠️  Private repository - Pages site will require authentication${NC}"
fi

echo ""
echo -e "${GREEN}🎉 Setup complete!${NC}"
echo ""
echo "🌐 Your website will be available at:"
echo "   $PAGES_URL"
echo ""
echo "⏳ Note: It may take a few minutes for the site to be live."
echo ""
echo "📊 To check deployment status:"
echo "   gh run watch -R $GITHUB_USER/$REPO_NAME"
echo ""
echo "🔧 To make changes and redeploy:"
echo "   1. Edit files in this directory"
echo "   2. git add ."
echo "   3. git commit -m 'Update website'"
echo "   4. git push"
echo ""
