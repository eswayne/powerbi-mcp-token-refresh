# How to Publish to GitHub - Simple Guide

Your repository is **ready to publish**! Follow these 3 simple steps:

## ✅ Step 1: Create Repository on GitHub

The browser should have already opened to GitHub's "Create a new repository" page.

If not, go to: **https://github.com/new**

Fill in:
- **Repository name:** `powerbi-mcp-token-refresh` ✅
- **Description:** Already filled in ✅
- **Public** ✅ (or Private if you prefer)
- **DO NOT** check any boxes at the bottom! ❌

Click **"Create repository"**

## ✅ Step 2: Get a GitHub Personal Access Token

You need a token to push code (GitHub no longer accepts passwords).

### Quick Method:
1. Click this link: **https://github.com/settings/tokens/new**
2. Note: `Power BI MCP Publish`
3. Expiration: `30 days`
4. Select scopes: Check **`repo`** (Full control of private repositories)
5. Click **"Generate token"**
6. **COPY THE TOKEN** (you'll only see it once!)

Keep this token handy - you'll need it in the next step.

## ✅ Step 3: Push Code to GitHub

Open a terminal and run:

```bash
cd ~/Projects/powerbi-mcp-token-refresh
bash publish-https.sh
```

**When prompted:**
- Username: `eswayne`
- Password: **Paste your Personal Access Token** (not your GitHub password!)

That's it! The script will push your code and open the repository in your browser.

---

## 🎉 Success!

Once published, your repository will be at:
**https://github.com/eswayne/powerbi-mcp-token-refresh**

### What's Included:
- ✅ Automatic token refresh scripts
- ✅ CLI tool (`pbi-token`)
- ✅ Comprehensive documentation
- ✅ Security best practices
- ✅ MIT License
- ✅ Contribution guidelines

### Optional Enhancements:

**Add Topics** (helps people find your project):
1. Go to repository page
2. Click ⚙️ next to "About"
3. Add topics: `powerbi`, `mcp`, `claude-code`, `azure-ad`, `authentication`, `automation`
4. Save

**Star Your Own Repository** ⭐
- Click the Star button on your repository page

**Share It!**
- Tweet about it
- Share on LinkedIn
- Add to your resume

---

## 🐛 Troubleshooting

### "Repository not found"
**Solution:** Make sure you created the repository on GitHub first (Step 1)

### "Authentication failed"
**Solution:** Make sure you're using a Personal Access Token, not your GitHub password

### "Repository already exists"
**Solution:** Either:
1. Use the existing repository
2. Delete it and create a new one
3. Choose a different name

### "Permission denied"
**Solution:** Check that your token has the `repo` scope

---

## 📞 Need Help?

- **Can't create repository?** Make sure you're logged into GitHub
- **Token issues?** Create a new token at https://github.com/settings/tokens/new
- **Other problems?** Open an issue once your repo is published

---

## 🚀 Quick Summary

```bash
# 1. Create repo on GitHub (browser)
open https://github.com/new

# 2. Get token (browser)
open https://github.com/settings/tokens/new

# 3. Push code (terminal)
cd ~/Projects/powerbi-mcp-token-refresh
bash publish-https.sh
```

**That's it! You're done!** 🎉
