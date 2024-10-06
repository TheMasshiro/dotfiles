#!/usr/bin/env zsh

# Function to prompt for confirmation
confirm_action() {
    local prompt="$1"
    while true; do
        read -r "response?$prompt [y/n]: "
        case "${response:l}" in
            y|yes) return 0 ;;
            n|no) return 1 ;;
            *) echo "Please answer with y/yes or n/no." ;;
        esac
    done
}

# System update
if confirm_action "Do you want to start system update?"; then
    echo "\nStarting system update"
    # Clean first before updating
    if ! sudo dnf autoremove && sudo dnf clean all; then
        echo "Cleaning failed"
        exit 1
    fi
    # Perform system upgrade
    if ! sudo dnf upgrade --refresh; then
        echo "System upgrade failed"
        exit 1
    fi
    # Clean up after updating
    if ! sudo dnf autoremove && sudo dnf clean all; then
        echo "Post-update cleaning failed"
        exit 1
    fi
fi

# Flatpak update
if confirm_action "Do you want to update Flatpak?"; then
    echo "\nStarting Flatpak update"
    if ! flatpak update -y; then
        echo "Flatpak update failed"
        exit 1
    fi
fi

# Mise update
if confirm_action "Do you want to update Mise?"; then
    echo "\nStarting Mise update"
    if ! mise self-update -y; then
        echo "Mise self-update failed"
        exit 1
    fi
fi

# NPM global update
if confirm_action "Do you want to update NPM global packages?"; then
    echo "\nStarting npm global update"
    if ! npm update -g; then
        echo "NPM global update failed"
        exit 1
    fi
fi

# Pip update
if confirm_action "Do you want to update pip packages?"; then
    echo "\nStarting pip update"
    outdated=$(pip list --outdated --format=columns | awk 'NR>2 {print $1}')
    if [ -n "$outdated" ]; then
        echo "Outdated packages found. Updating..."
        if ! echo "$outdated" | xargs -n1 pip install --upgrade; then
            echo "Pip update failed"
            exit 1
        fi
    else
        echo "No pip packages to update."
    fi
fi

echo "All requested updates completed successfully!"
