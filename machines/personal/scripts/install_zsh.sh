#!/usr/bin/env bash

# Function to get the base name of a file
basename() {
  echo "${1##*/}"
}

# Display usage information
usage() {
  cat <<EOF
Usage: $(basename "$0") [options]
Installs the zshrc file.

Options:
  -h, --help    Display this help message.
EOF
}

check_if_root() {
  if [[ $EUID -eq 0 ]]; then
    echo "Error: This script should not be run as root." 1>&2
    exit 1
  fi
}

# Function to finalize the installation
finalize() {
  local zsh_path
  zsh_path=$(command -v zsh)

  if [[ -z "$zsh_path" ]]; then
    echo "Error: zsh not found."
    exit 1
  fi

  echo "Changing the default shell to zsh..."
  chsh -s "$zsh_path" || { echo "Error: Unable to change the shell."; exit 1; }

  echo "Sourcing the new zsh configuration..."
  source ~/.zshrc || { echo "Error: Unable to source ~/.zshrc."; exit 1; }

  echo "Installation complete! Please restart your terminal to apply the changes."
}

# Check if required dependencies are installed
check_dependencies() {
  local dependencies=("git" "zsh" "curl")
  for cmd in "${dependencies[@]}"; do
    if ! command -v "$cmd" > /dev/null 2>&1; then
      echo "Error: $cmd is not installed. Please install it using your package manager."
      exit 1
    fi
  done
}

# Main function to install the zshrc file
install_zshrc() {
  local repo_url="https://github.com/stellaOnEstrogen/dotfiles"
  local tmp_dir
  tmp_dir=$(mktemp -d)

  echo "Cloning the dotfiles repository..."
  git clone "$repo_url" "$tmp_dir" || { echo "Error: Failed to clone the repository."; exit 1; }

  echo "Copying the zshrc file..."
  cp "$tmp_dir/machines/personal/assets/zsh/.zshrc" "$HOME/" || {
    echo "Error: Failed to copy the zshrc file."; exit 1;
  }

  echo "Cleaning up temporary files..."
  rm -rf "$tmp_dir"

  finalize
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
  check_if_root
  check_dependencies
  install_zshrc
}

# Run the script
main "$@"
