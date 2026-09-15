#!/bin/bash
# Publish repository to GitHub using HTTPS
# This is easier than SSH for first-time setup

set -e

GITHUB_USER="eswayne"
REPO_NAME="powerbi-mcp-token-refresh"
REPO_DIR="$HOME/Projects/powerbi-mcp-token-refresh"

echo "🚀 Publishing Power BI MCP Token Auto-Refresh to GitHub (HTTPS)"
echo ""

# Change to repository directory
cd "$REPO_DIR" || exit 1

# Check if remote already exists
if git remote get-url origin > /dev/null 2>&1; then
    echo "⚠️  Remote 'origin' already exists. Removing it..."
    git remote remove origin
fi

echo "📡 Adding GitHub remote (HTTPS)..."
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo "✅ Remote added: https://github.com/$GITHUB_USER/$REPO_NAME.git"

echo ""
echo "📤 Pushing to GitHub..."
echo ""
echo "⚠️  You will be prompted for GitHub credentials:"
echo "   Username: $GITHUB_USER"
echo "   Password: Use a Personal Access Token (NOT your GitHub password)"
echo ""
echo "To create a token:"
echo "   1. Go to https://github.com/settings/tokens/new"
echo "   2. Note: 'Power BI MCP Publish'"
echo "   3. Expiration: 30 days"
echo "   4. Select scope: 'repo'"
echo "   5. Click 'Generate token'"
echo "   6. Copy the token and paste it when prompted for password"
echo ""

read -p "Press Enter when ready to push..."

# Push to GitHub
if git push -u origin main; then
    echo ""
    echo "✅ Successfully published to GitHub!"
    echo ""
    echo "🌐 Repository URL:"
    echo "   https://github.com/$GITHUB_USER/$REPO_NAME"
    echo ""
    echo "📝 Next steps:"
    echo "   1. Visit your repository to verify all files are there"
    echo "   2. Add topics: powerbi, mcp, claude-code, azure-ad"
    echo "   3. Star the repository ⭐"
    echo ""
    echo "🎉 Your project is now public!"

    # Open in browser
    open "https://github.com/$GITHUB_USER/$REPO_NAME"
else
    echo ""
    echo "❌ Failed to push to GitHub"
    echo ""
    echo "Common issues:"
    echo "  1. Repository doesn't exist - create it first at:"
    echo "     https://github.com/new"
    echo ""
    echo "  2. Wrong credentials - ensure you're using a Personal Access Token"
    echo "     (not your GitHub password)"
    echo ""
    echo "  3. Token doesn't have 'repo' scope - create a new token with:"
    echo "     https://github.com/settings/tokens/new"
    echo ""
    exit 1
fi
