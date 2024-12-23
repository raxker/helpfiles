#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Get the current shell
current_shell=$(echo $SHELL)

# Line to add using script location
ADD_LINE=". ${SCRIPT_DIR}/profile"
echo "${SCRIPT_DIR}/profile"

# Function to append line if not exists
append_if_not_exists() {
    if [ -f "$1" ]; then
        echo "Found config file: $1"
        
        # Check if line already exists
        if grep -Fxq "$ADD_LINE" "$1"; then
            echo "Entry already exists in $1"
        else
            echo "Adding entry to $1"
            echo "$ADD_LINE" >> "$1"

            if [ ! -d "~/helpfiles" ]; then
                echo "Error: Source directory '$source_dir' does not exist."
                echo "Adding soft link to helpfile ${SCRIPT_DIR}"
                ln -s ${SCRIPT_DIR} ~/
            

            echo "Source $1"
            . $1
        fi
        
        # echo "Current contents of $1:"
        # echo "===================="
        # cat "$1"
    else
        echo "Config file not found: $1"
    fi
}

# Check which shell and modify appropriate config
case "$current_shell" in
    */bash)
        echo "Running Bash Shell"
        append_if_not_exists ~/.bashrc
        # append_if_not_exists ~/.bash_profile
        ;;
    */zsh)
        echo "Running Zsh Shell"
        append_if_not_exists ~/.zshrc
        ;;
    */fish)
        echo "Running Fish Shell"
        append_if_not_exists ~/.config/fish/config.fish
        ;;
    */ksh)
        echo "Running Korn Shell"
        append_if_not_exists ~/.kshrc
        ;;
    */tcsh)
        echo "Running Tcsh Shell"
        append_if_not_exists ~/.tcshrc
        ;;
    *)
        echo "Unknown shell: $current_shell"
        ;;
esac


