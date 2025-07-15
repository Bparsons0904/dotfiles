# Fixing Flatpak Permissions

This document outlines how to resolve permission issues with Flatpak applications, specifically for Chrome PWA installation.

## Using Flatseal

1. Install Flatseal:
```bash
flatpak install flathub com.github.tchx84.Flatseal
```

2. Open Flatseal and select Chrome from the list of applications

3. Under "Filesystem" permissions, toggle on access to:
   - `~/.local/share/applications`
   - `~/.local/share/icons`

4. Restart Chrome and try installing the PWA again

## Alternative: Command Line Method

You can also grant permissions via command line:

```bash
flatpak override com.google.Chrome --filesystem=~/.local/share/applications:create --filesystem=~/.local/share/icons:create
```

To check the correct Flatpak ID:
```bash
flatpak list --app
```

## Common Issues

If the above doesn't work:

1. Make sure you've completely restarted Chrome after changing permissions
2. Check that you're using the correct Flatpak ID for your Chrome installation
3. Verify that the directories exist and have proper ownership:
```bash
mkdir -p ~/.local/share/applications ~/.local/share/icons
```
