# Contributing to Power BI MCP Token Auto-Refresh

Thank you for considering contributing to this project! 🎉

## 🤝 How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:

1. **Clear title** - Brief description of the problem
2. **Environment details** - OS, shell, versions
3. **Steps to reproduce** - How to trigger the bug
4. **Expected behavior** - What should happen
5. **Actual behavior** - What actually happens
6. **Logs** - Relevant error messages or logs

### Suggesting Enhancements

We welcome feature requests! Please include:

1. **Use case** - Why is this feature needed?
2. **Proposed solution** - How should it work?
3. **Alternatives** - Other approaches considered
4. **Additional context** - Screenshots, examples, etc.

### Pull Requests

1. **Fork the repository**
   ```bash
   gh repo fork eswayne/powerbi-mcp-token-refresh
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```

3. **Make your changes**
   - Follow existing code style
   - Add comments for complex logic
   - Update documentation if needed

4. **Test your changes**
   ```bash
   # Test scripts manually
   bash refresh-token.sh
   bash auto-refresh-token.sh
   bash proactive-refresh.sh
   bash pbi-token help
   ```

5. **Commit your changes**
   ```bash
   git commit -m "Add amazing feature"
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/amazing-feature
   ```

7. **Create a Pull Request**
   - Describe what changed and why
   - Reference related issues
   - Include test results

## 📝 Code Style

### Shell Scripts

- Use `#!/bin/bash` shebang
- Include descriptive comments
- Use meaningful variable names
- Add error handling with `set -e`
- Quote variables: `"$VARIABLE"`
- Use functions for reusable code

Example:
```bash
#!/bin/bash
# Description of what this script does

set -e

VARIABLE_NAME="value"

function_name() {
    local param="$1"
    echo "Processing: $param"
}

# Main logic
function_name "$VARIABLE_NAME"
```

### Documentation

- Use clear, concise language
- Include code examples
- Add screenshots for UI changes
- Keep README.md updated
- Document new features in comments

## 🔒 Security

**Never commit sensitive information:**

- Azure AD credentials
- Access tokens
- API keys
- Personal data

Always use:
- `credentials.example.json` for templates
- `.gitignore` for exclusions
- Environment variables when possible

## ✅ Testing

Before submitting a PR:

1. **Test all scripts manually**
   ```bash
   bash refresh-token.sh
   bash auto-refresh-token.sh
   bash proactive-refresh.sh
   bash pbi-token status
   bash pbi-token check
   ```

2. **Verify logging works**
   ```bash
   tail -f ~/.claude/powerbi/token-refresh.log
   ```

3. **Test error scenarios**
   - Invalid credentials
   - Network failures
   - Missing files

4. **Check permissions**
   ```bash
   ls -l *.sh pbi-token
   # All should be executable (chmod +x)
   ```

## 📋 Commit Message Guidelines

Format:
```
<type>: <subject>

<body>

<footer>
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style (formatting, missing semi colons, etc)
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

Examples:
```
feat: Add support for Windows platform

- Adapt scripts for PowerShell
- Update documentation for Windows users
- Test on Windows 11

Closes #123
```

```
fix: Handle network timeout in refresh script

- Add timeout to curl command
- Improve error messaging
- Log retry attempts

Fixes #456
```

## 🎯 Development Workflow

1. **Check existing issues** - Avoid duplicate work
2. **Discuss major changes** - Open an issue first
3. **Keep PRs focused** - One feature/fix per PR
4. **Write clear commits** - Follow commit guidelines
5. **Update documentation** - Keep README current
6. **Test thoroughly** - Manual testing required
7. **Request review** - Tag maintainers

## 🐛 Debugging

Enable debug logging:

```bash
# Add to scripts
set -x  # Print commands before execution

# Or run with bash -x
bash -x refresh-token.sh
```

Check logs:
```bash
tail -f ~/.claude/powerbi/token-refresh.log
```

## 📞 Getting Help

- **Questions:** [GitHub Discussions](https://github.com/eswayne/powerbi-mcp-token-refresh/discussions)
- **Bugs:** [GitHub Issues](https://github.com/eswayne/powerbi-mcp-token-refresh/issues)
- **Email:** eswayne@gmail.com

## 🏆 Recognition

Contributors will be:
- Listed in README.md
- Mentioned in release notes
- Credited in commit messages

Thank you for making this project better! 🙌

---

**Questions?** Open a [discussion](https://github.com/eswayne/powerbi-mcp-token-refresh/discussions) or reach out!
