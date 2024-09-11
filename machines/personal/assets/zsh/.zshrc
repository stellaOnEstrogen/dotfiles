# Set the directory where Oh My Zsh is installed
# The variable $HOME points to your home directory
export ZSH="$HOME/.oh-my-zsh"

# Set the Zsh theme to "cloud"
# You can change this to other themes that come with Oh My Zsh, or create your own custom theme
ZSH_THEME="cloud"

# Specify the plugins to load
# 'git' provides useful aliases and functions for git, while 'node' gives Node.js helpers and shortcuts
plugins=(git node)

# Source the main Oh My Zsh script to apply the configuration
# This loads the theme, plugins, and other configurations provided by Oh My Zsh
source $ZSH/oh-my-zsh.sh
