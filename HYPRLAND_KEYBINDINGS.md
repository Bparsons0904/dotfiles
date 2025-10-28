# Hyprland Keybindings Reference

> Note: `$mainMod` refers to the Super/Windows key

## Applications

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + Return` | Terminal | Opens Ghostty terminal emulator |
| `Super + F` | File Manager | Opens COSMIC Files file manager |
| `Super + B` | Browser | Opens Google Chrome browser |
| `Super` (tap) | App Launcher | Opens COSMIC application launcher |

## Window Management

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + Q` | Close Window | Closes (not kill) current window |
| `Super + V` | Toggle Floating | Switches window between floating and tiling mode |
| `Super + M` | Fullscreen | Toggles current window fullscreen mode |
| `Super + Y` | Pin Window | Pin current window (shows on all workspaces) |
| `Super + J` | Toggle Split | Toggles current window split mode (dwindle) |
| `Super + T` | Toggle Group | Toggles current window group mode |
| `Super + Tab` | Next in Group | Switches to the next window in the group |

## Window Movement

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + ←/→/↑/↓` | Move Focus (Arrows) | Move focus in the specified direction |
| `Super + h/j/k/l` | Move Focus (Vim) | Move focus in vim-style directions |
| `Super + Shift + ←/→/↑/↓` | Move Window (Arrows) | Move active window in the specified direction |
| `Super + LMB + Drag` | Move Window (Mouse) | Move window by dragging |

## Window Resizing

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + R` | Resize Mode | Activates window resizing mode |
| `Super + Ctrl + Shift + ←/→/↑/↓` | Quick Resize (Arrows) | Resize window in the specified direction |
| `Super + Ctrl + Shift + h/j/k/l` | Quick Resize (Vim) | Resize window in vim-style directions |
| `Super + RMB + Drag` | Resize Window (Mouse) | Resize window by dragging |

### Resize Mode (After `Super + R`)

| Keybinding | Description |
|------------|-------------|
| `←/→/↑/↓` or `h/j/k/l` | Resize in the specified direction |
| `Esc` | Exit resize mode |

## Workspaces

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + 1-9/0` | Switch Workspace | Switch to workspace 1-10 |
| `Super + ,` | Previous Workspace | Scroll through workspaces decrementally |
| `Super + .` | Next Workspace | Scroll through workspaces incrementally |
| `Super + /` | Last Workspace | Switch to the previous workspace |
| `Super + Mouse Scroll` | Scroll Workspaces | Scroll through workspaces with mouse |

## Moving Windows to Workspaces

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + Ctrl + 1-9/0` | Move & Switch | Move window and switch to workspace 1-10 |
| `Super + Shift + 1-9/0` | Move Silently | Move window to workspace 1-10 without switching |
| `Super + Ctrl + ←/→` | Move & Switch Next/Prev | Move window and switch to next/previous workspace |

## Special Workspaces (Scratchpads)

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + -` | Move to Special | Move active window to Special workspace |
| `Super + =` | Toggle Special | Toggle the Special workspace |
| `Super + F1` | Toggle Scratchpad | Toggle special workspace scratchpad |
| `Super + Alt + Shift + F1` | Move to Scratchpad | Move window to scratchpad workspace |

## Monitor Management

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + \`` | Focus Ultrawide | Focus primary ultrawide monitor (HDMI-A-1) |
| `Super + Shift + \`` | Focus 27" Monitor | Focus 27" monitor (DP-2) |

## Screenshots

| Keybinding | Name | Description |
|------------|------|-------------|
| `Print` | Screenshot Area | Creates a screenshot of a selected area |
| `Ctrl + Print` | Screenshot Window | Creates a screenshot of the active window |
| `Alt + Print` | Screenshot Screen | Creates a screenshot of the active display |
| `Super + Shift + S` | Screenshot Area (Alt) | Alternative binding for area screenshot |

## System Controls

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + Shift + M` | Exit Hyprland | Exits Hyprland by terminating user session |
| `Super + O` | Reload Waybar | Reload/restarts Waybar status bar |
| `Super + Shift + R` | Reload Hyprland | Reload Hyprland configuration |

## Gaps Control

| Keybinding | Name | Description |
|------------|------|-------------|
| `Super + G` | Remove Gaps | Remove gaps between windows |
| `Super + Shift + G` | Default Gaps | Set CachyOS default gaps (5px out, 3px in) |

## Media Controls

| Keybinding | Name | Description |
|------------|------|-------------|
| `XF86AudioPlay` | Play/Pause | Toggles media play/pause |
| `XF86AudioNext` | Next Track | Skip to next track |
| `XF86AudioPrev` | Previous Track | Go to previous track |
| `XF86AudioRaiseVolume` | Volume Up | Increase volume by 5% |
| `XF86AudioLowerVolume` | Volume Down | Decrease volume by 5% |
| `XF86AudioMute` | Mute | Toggle audio mute |

## Brightness Control

| Keybinding | Name | Description |
|------------|------|-------------|
| `XF86MonBrightnessUp` | Brightness Up | Increase screen brightness by 5% |
| `XF86MonBrightnessDown` | Brightness Down | Decrease screen brightness by 5% |

---

*Generated from Hyprland configuration*
*Last updated: 2025-10-19*
