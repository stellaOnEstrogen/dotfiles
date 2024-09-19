<h1 align="center">Password Generator Script</h1>

This script generates secure passwords based on user-defined configurations. It allows users to customize password length, character types, and other security features. Users can save, load, and manage multiple configurations.

## Table of Contents

- [Usage](#usage)
- [Features](#features)
- [Installation](#installation)
- [Code Reference](#code-reference)

## Usage

To use the script, run it from the command line with the following options:

```sh
./pass-gen # Generate passwords using the last or default configuration
./pass-gen -c, --config # Open the configuration menu
./pass-gen -g, --generate N # Generate N passwords using current configuration
./pass-gen -l, --load NAME # Load a specific configuration
./pass-gen -s, --save NAME # Save current configuration with a specific name
./pass-gen -h, --help # Display help information
./pass-gen -v, --version # Display version information
```


## Features

- **Generate Passwords**: Generate secure passwords based on the current configuration.
- **Configuration Menu**: Customize password length, character types, and other security features.
- **Save/Load Configurations**: Save and load multiple configurations for different use cases.
- **Exclude Characters**: Exclude specific characters from the generated passwords.
- **No Similar Characters**: Avoid similar characters (e.g., 1, I, O, l) in passwords.
- **No Duplicate Characters**: Ensure no duplicate characters in passwords.
- **No Sequential Characters**: Avoid sequential characters in passwords.


## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/stellaOnEstrogen/dotfiles
    cd dotfiles/scripts/pass-gen
    ```

2. Make the script executable:
    ```sh
    chmod +x pass-gen
    ```

3. Run the script:
    ```sh
    ./pass-gen
    ```


## Code Reference

The main script is located in the following file:

- [pass-gen](./pass-gen)
