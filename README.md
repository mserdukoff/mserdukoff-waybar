# MSerdukoff Waybar Configuration

A beautiful and functional waybar configuration featuring the KnightfallXZ theme with perfect spacing and modern aesthetics.

## 🎨 Featured Themes

### Default Themes (Active)
- **KnightfallXZ Waybar** - Main theme with compact spacing, system monitoring, and media controls
- **KnightfallXZ Tokyo Night** - Minimal Tokyo Night variant with clean aesthetics

### Features
- 🖥️ **Workspace indicators** with bracket-style design `[1][2][*][4][5]`
- 💻 **System monitoring** (CPU, Memory, Disk usage with icons)
- 🎵 **Media player controls** (shows current song/video title)
- 🔊 **Volume controls** with proper icons
- 📦 **Update notifications** (supports paru, yay, pacman)
- 🔔 **System notifications** (SwayNC integration)
- 🌐 **Network status**
- 🔋 **Battery monitoring** (when available)
- 💡 **Backlight controls** (when available)

## 🚀 Quick Start

### Apply Main Theme
```bash
cd ~/.config/waybar/themes/default/knightfallxz-waybar && ./config.sh
```

### Apply Tokyo Night Theme
```bash
cd ~/.config/waybar/themes/default/knightfallxz-tokyo && ./config.sh
```

## 📁 Structure

```
waybar/
├── themes/
│   ├── default/                    # Active themes
│   │   ├── knightfallxz-waybar/   # Main theme
│   │   └── knightfallxz-tokyo/    # Tokyo Night variant
│   └── extra unused themes/       # Archived themes
├── colors.css                     # Color definitions
├── modules.json                   # Module configurations
├── launch.sh                      # Launch script
├── themeswitcher.sh               # Theme switcher
└── toggle.sh                      # Toggle script
```

## 🎯 Theme Highlights

- **Perfect spacing** - All elements have consistent, compact spacing
- **No visual artifacts** - Clean design without background rectangles
- **Responsive design** - Adapts to different screen sizes (optimized for ultrawide)
- **Icon consistency** - All modules use proper Nerd Font icons
- **Color-coded workspaces** - Each workspace has its own distinct color
- **Bracket-style workspaces** - `[*]` for active, `[1]` for inactive

## 🛠 Dependencies

### Required
- waybar
- playerctl
- htop
- pavucontrol
- nm-connection-editor
- kitty

### Optional
- filelight (disk usage visualization)
- checkupdates (Arch Linux updates)
- blueberry (Bluetooth management)
- wofi (application launcher)
- swaync (notification daemon)

## 📝 Customization

The themes are fully customizable through their respective `config` and `style.css` files. Each theme includes:
- Complete waybar configuration
- Custom CSS styling
- Helper scripts for functionality
- Easy-to-use installation script

## 🎨 Based On

This configuration is based on the excellent work from:
- [knightfallxz/Hyprland-Custom-Configuration](https://github.com/knightfallxz/Hyprland-Custom-Configuration)

Enhanced with custom spacing, organization, and additional features for the perfect waybar experience.
