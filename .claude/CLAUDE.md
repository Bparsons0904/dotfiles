# Global Claude Code Instructions

These instructions apply to all projects and override any default behavior.

## Code Standards
- Do not add business logic to make tests pass
- Go file names should be in camelCase

## Command Usage Guidelines

### Directory Navigation
**CRITICAL**: Never use `cd` in bash commands. The user has `alias cd='z'` (zoxide) which causes failures in Claude Code environment.

**Always use one of these instead:**
- **Absolute paths**: `ls /home/bobparsons/dotfiles/.config/nvim/`
- **Builtin cd**: `\cd /path/to/directory` (escapes the alias)
- **Combined commands**: `ls /home/bobparsons/dotfiles/.config/nvim/ && echo "done"`

**Examples:**
```bash
# ❌ WRONG - Will fail due to zoxide alias
cd /home/bobparsons/dotfiles && ls

# ✅ CORRECT - Use absolute paths
ls /home/bobparsons/dotfiles/

# ✅ CORRECT - Use builtin cd if needed
\cd /home/bobparsons/dotfiles && ls

# ✅ BEST - Use absolute paths throughout
mv /home/bobparsons/dotfiles/file1 /home/bobparsons/dotfiles/backup/
```

### Tool Preferences
- Use `\cd` instead of `cd` when directory changes are required
- Prefer absolute paths over relative paths in all commands
- Use `rg` (ripgrep) instead of `grep` for searching