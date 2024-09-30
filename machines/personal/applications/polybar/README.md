<h1 align="center">Personal Polybar Configuration</h1>

Welcome to the configuration hub for my Polybar setup! This directory holds all the details about the modules, scripts, and personal tweaks that make my Polybar setup unique. If you're looking to customize your own setup or are just curious about my configuration, you're in the right place.

## Table of Contents
- [Installation](#installation)
- [Configuration](#configuration)
- [Modules](#modules)
- [Screenshots](#screenshots)

## Installation

To install my Polybar configuration, simply clone my dotfiles repository and copy the Polybar configuration files to your Polybar config directory:

```bash
git clone https://github.com/stellaOnEstrogen/dotfiles.git
cp -r dotfiles/machines/personal/applications/polybar ~/.config/polybar
```

## Configuration

The main configuration file is `config.ini`, which includes settings for colors, bars, and modules. You can customize it to fit your needs.

## Modules

Here's a list of some modules I use in my Polybar setup:

- `i3` for i3 workspaces
- `internet` for network status
- `weather` for weather updates
- `pulseaudio` for volume control
- `date` for date and time

For a full list of modules and their configurations, refer to the [config file](./config.ini).

## Screenshots

Here’s a peek at my setup:

![Main](../../assets/polybar/image.png)