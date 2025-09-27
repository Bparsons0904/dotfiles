# Switch from Fish to Zsh on CachyOS/COSMIC

## The Problem

CachyOS defaults to fish shell, but COSMIC desktop sets `SHELL=/bin/fish` as an environment variable that overrides your system default shell setting, even after properly changing it with `chsh`.

## Quick Solution

1. **Install zsh** (if not already installed):

   ```bash
   sudo pacman -S zsh
   ```

2. **Change your default shell**:

   ```bash
   chsh -s /usr/bin/zsh
   ```

3. **Override the environment variable** by adding this to `~/.zshrc`:

   ```bash
   echo 'export SHELL=/usr/bin/zsh' >> ~/.zshrc
   ```

4. **Restart** your computer or log out/in for full effect.

## Verification Steps

Check that everything is working:

```bash
# Verify your default shell in passwd
grep "^$(whoami):" /etc/passwd

# Check the environment variable
echo $SHELL

# Verify zsh is working in new terminals
echo $0
```

## Troubleshooting

If terminals still start with fish:

1. **Check if zsh is in allowed shells**:

   ```bash
   cat /etc/shells
   ```

   If `/usr/bin/zsh` is missing, add it:

   ```bash
   echo "/usr/bin/zsh" | sudo tee -a /etc/shells
   ```

2. **Check for shell overrides**:

   ```bash
   env | grep -i shell
   ```

3. **Manual override** - add to `~/.zshrc`:
   ```bash
   export SHELL=/usr/bin/zsh
   ```

## Why This Happens

- CachyOS defaults to fish shell
- COSMIC desktop environment sets `SHELL=/bin/fish` in the environment
- Terminal emulators respect the `SHELL` environment variable over `/etc/passwd`
- The `chsh` command correctly updates `/etc/passwd` but doesn't affect the session environment variable

## Next Steps

After switching to zsh, consider:

- Installing a zsh framework like Oh My Zsh or Starship
- Configuring Powerlevel10k (if it auto-installed)
- Setting up your preferred zsh plugins and configuration
