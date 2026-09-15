#!/bin/bash
# Publish repository to GitHub

set -e

GITHUB_USER="eswayne"
REPO_NAME="powerbi-mcp-token-refresh"
REPO_DIR="$HOME/Projects/powerbi-mcp-token-refresh"

echo "🚀 Publishing Power BI MCP Token Auto-Refresh to GitHub"
echo ""

# Change to repository directory
cd "$REPO_DIR" || exit 1

# Check if remote already exists
if git remote get-url origin > /dev/null 2>&1; then
    echo "✅ Remote 'origin' already configured"
    git remote -v
else
    echo "📡 Adding GitHub remote..."
    git remote add origin "git@github.com:$GITHUB_USER/$REPO_NAME.git"
    echo "✅ Remote added: git@github.com:$GITHUB_USER/$REPO_NAME.git"
fi

echo ""
echo "📤 Pushing to GitHub..."

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
    echo "   2. Add topics: powerbi, mcp, claude-code, azure-ad, authentication"
    echo "   3. Create a release (optional): git tag v1.0.0 && git push --tags"
    echo ""
    echo "🎉 Your project is now public!"

    # Open in browser
    open "https://github.com/$GITHUB_USER/$REPO_NAME"
else
    echo ""
    echo "❌ Failed to push to GitHub"
    echo ""
    echo "Common issues:"
    echo "  1. Repository doesn't exist yet - create it first:"
    echo "     https://github.com/new"
    echo ""
    echo "  2. SSH key not configured - test with:"
    echo "     ssh -T git@github.com"
    echo ""
    echo "  3. Remote URL incorrect - check with:"
    echo "     git remote -v"
    echo ""
    exit 1
fi
