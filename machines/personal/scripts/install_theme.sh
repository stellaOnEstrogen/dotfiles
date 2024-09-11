#!/usr/bin/env bash

# Function to get the base name of a file
basename() {
  echo "${1##*/}"
}

# Display usage information
usage() {
  cat <<EOF
Usage: $(basename "$0") [options]
Installs the Catppuccin-Dark GNOME theme.

Options:
  -h, --help    Display this help message.
EOF
}

# Set the GNOME theme using gsettings
set_gnome_theme() {
  local theme_name="Catppuccin-Dark"
  echo "Setting GNOME theme to $theme_name..."
  
  if gsettings set org.gnome.desktop.interface gtk-theme "$theme_name"; then
    echo "GNOME theme set successfully!"
  else
    echo "Error: Failed to set GNOME theme. Ensure GNOME is installed and running."
    exit 1
  fi
}

# Check if required dependencies are installed
check_dependencies() {
  local dependencies=("git" "gsettings")
  for cmd in "${dependencies[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
      echo "Error: $cmd is not installed. Please install it using your package manager."
      exit 1
    fi
  done
}

# Main function to install the theme
install_theme() {
  local repo_url="https://github.com/stellaOnEstrogen/dotfiles"
  local tmp_dir
  tmp_dir=$(mktemp -d)
  local theme_dir="$HOME/.themes"
  local theme_name="Catppuccin-Dark"

  echo "Installing the Catppuccin-Dark theme..."

  # Create the theme directory if it doesn't exist
  mkdir -p "$theme_dir"

  # Clone the repository
  if ! git clone "$repo_url" "$tmp_dir"; then
    echo "Error: Failed to clone repository."
    exit 1
  fi

  # Copy the theme files
  if ! cp -r "$tmp_dir/machines/personal/applications/gnome/theme/$theme_name" "$theme_dir"; then
    echo "Error: Failed to copy theme files."
    exit 1
  fi

  # Clean up the temporary directory
  rm -rf "$tmp_dir"

  # Set the GNOME theme
  set_gnome_theme

  echo "Theme installation complete!"
}

# Parse command-line arguments
parse_arguments() {
  while [[ "$#" -gt 0 ]]; do
    case "$1" in
      -h|--help) usage; exit 0 ;;
      *) echo "Error: Unknown option '$1'"; usage; exit 1 ;;
    esac
    shift
  done
}

# Entry point
main() {
  parse_arguments "$@"
  check_dependencies
  install_theme
}

# Run the script
main "$@"
