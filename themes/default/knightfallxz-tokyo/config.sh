#!/bin/bash
# KnightfallXZ Tokyo Night Waybar Configuration
# Based on https://github.com/knightfallxz/Hyprland-Custom-Configuration

# Theme name
theme_name="KnightfallXZ Tokyo Night"

# Theme description
theme_description="A minimal Tokyo Night themed waybar with clean aesthetics and essential modules"

# Required dependencies
dependencies=(
    "waybar"
    "playerctl" 
    "htop"
    "pavucontrol"
    "kitty"
)

# Optional dependencies
optional_dependencies=(
    "wofi"
    "nm-connection-editor"
)

# Check if dependencies are installed
check_dependencies() {
    local missing_deps=()
    
    for dep in "${dependencies[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing_deps+=("$dep")
        fi
    done
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        echo "Missing required dependencies: ${missing_deps[*]}"
        echo "Please install them before using this theme."
        return 1
    fi
    
    return 0
}

# Apply theme function
apply_theme() {
    echo "Applying $theme_name..."
    
    # Check dependencies first
    if ! check_dependencies; then
        return 1
    fi
    
    # Copy configuration files
    local theme_dir="$HOME/.config/waybar/themes/default/knightfallxz-tokyo"
    
    if [ -f "$theme_dir/config" ] && [ -f "$theme_dir/style.css" ]; then
        cp "$theme_dir/config" "$HOME/.config/waybar/"
        cp "$theme_dir/style.css" "$HOME/.config/waybar/"
        echo "Configuration files copied successfully."
    else
        echo "Error: Theme configuration files not found!"
        return 1
    fi
    
    # Restart waybar if it's running
    if pgrep -x "waybar" > /dev/null; then
        echo "Restarting waybar..."
        pkill waybar
        sleep 1
        waybar &
    fi
    
    echo "$theme_name applied successfully!"
    return 0
}

# If script is run directly, apply the theme
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    apply_theme
fi
