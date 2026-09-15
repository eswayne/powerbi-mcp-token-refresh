# Deploy to GitHub

## 📦 Repository Ready to Publish!

Your repository is initialized and committed locally. Follow these steps to publish to GitHub.

## 🚀 Method 1: GitHub Web Interface (Easiest)

### Step 1: Create Repository on GitHub

1. Go to https://github.com/new
2. Fill in the details:
   - **Repository name:** `powerbi-mcp-token-refresh`
   - **Description:** `Automatic Azure AD token refresh for Power BI MCP servers - eliminates authentication failures`
   - **Visibility:** Public ✅ (or Private if preferred)
   - **DO NOT** initialize with README, .gitignore, or license (we already have these!)

3. Click **"Create repository"**

### Step 2: Push Local Repository

GitHub will show you commands. Use these:

```bash
cd ~/Projects/powerbi-mcp-token-refresh

# Add remote
git remote add origin git@github.com:eswayne/powerbi-mcp-token-refresh.git

# Push to GitHub
git push -u origin main
```

### Step 3: Verify

Visit: https://github.com/eswayne/powerbi-mcp-token-refresh

You should see all your files!

## 🔑 Method 2: Using GitHub CLI

If you have GitHub CLI installed:

```bash
cd ~/Projects/powerbi-mcp-token-refresh

# Login to GitHub
gh auth login

# Create repository
gh repo create powerbi-mcp-token-refresh \
  --public \
  --description "Automatic Azure AD token refresh for Power BI MCP servers" \
  --source=. \
  --push

# Open in browser
gh repo view --web
```

## 🛠️ Method 3: Using GitHub API

If you have a Personal Access Token:

```bash
# Set your token
export GITHUB_TOKEN='your_github_personal_access_token'

# Run the creation script
bash /tmp/create-github-repo.sh

# Push to GitHub
cd ~/Projects/powerbi-mcp-token-refresh
git remote add origin git@github.com:eswayne/powerbi-mcp-token-refresh.git
git push -u origin main
```

To create a Personal Access Token:
1. Go to https://github.com/settings/tokens/new
2. Token name: `Power BI MCP Token Refresh`
3. Select scopes: `repo` (Full control of private repositories)
4. Click "Generate token"
5. Copy the token (you'll only see it once!)

## 🔐 SSH Key Setup (if needed)

If you don't have SSH keys configured:

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "eswayne@gmail.com"

# Start SSH agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519

# Copy public key
cat ~/.ssh/id_ed25519.pub | pbcopy

# Add to GitHub:
# 1. Go to https://github.com/settings/keys
# 2. Click "New SSH key"
# 3. Title: "MacBook Pro"
# 4. Paste key from clipboard
# 5. Click "Add SSH key"
```

Test SSH connection:
```bash
ssh -T git@github.com
# Should see: "Hi eswayne! You've successfully authenticated..."
```

## ✅ Verification

After pushing, verify:

1. **Files are there:**
   - README.md
   - LICENSE
   - Scripts (.sh files)
   - .gitignore

2. **README displays nicely:**
   - Badges show
   - Markdown renders correctly

3. **No sensitive files:**
   - No credentials.json
   - No token-refresh.log
   - No .mcp.json

## 📝 Post-Publish Steps

### 1. Add Topics

Go to repository → Settings → Add topics:
- `powerbi`
- `mcp`
- `claude-code`
- `azure-ad`
- `authentication`
- `token-refresh`
- `automation`

### 2. Enable Discussions (Optional)

Settings → Features → Enable Discussions ✅

### 3. Add Repository Description

Should already be set from creation step.

### 4. Create Initial Release (Optional)

```bash
# Tag current commit
git tag -a v1.0.0 -m "Initial release: Power BI MCP Token Auto-Refresh"

# Push tag
git push origin v1.0.0
```

Then create release on GitHub:
1. Go to Releases → "Create a new release"
2. Choose tag: v1.0.0
3. Title: "v1.0.0 - Initial Release"
4. Description: Copy from README features section
5. Click "Publish release"

## 🎯 Current Status

```bash
# Check repository status
cd ~/Projects/powerbi-mcp-token-refresh
git status
git log --oneline
git remote -v
```

Expected output:
```
On branch main
nothing to commit, working tree clean

f6929a6 Initial commit: Power BI MCP Token Auto-Refresh

(no remotes yet - add with: git remote add origin ...)
```

## 🐛 Troubleshooting

### "Permission denied (publickey)"

**Solution:** Set up SSH keys (see SSH Key Setup above)

### "Repository already exists"

**Solution:** Use different name or delete existing repo first

### "Updates were rejected"

**Solution:** Pull first, then push:
```bash
git pull origin main --rebase
git push origin main
```

### Can't push to main

**Solution:** Check branch name:
```bash
git branch -M main  # Rename to main
git push -u origin main
```

---

## 🎉 Ready to Publish!

**Current directory:** `~/Projects/powerbi-mcp-token-refresh`
**Local commits:** ✅ Ready
**Remote repository:** ⏳ Create on GitHub first

**Next step:** Choose Method 1, 2, or 3 above and follow the steps!
