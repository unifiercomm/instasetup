#!/bin/bash

echo "• | Welcome to the Unifier Instant Setup script!"

# Main menu loop
while true; do
    echo ""
    echo "Main Menu:"
    echo "1. Install Unifier"
    echo "2. Remove Unifier"
    echo "3. Exit"
    read -p "Select an option [1-3]: " choice

    case $choice in
        1)
            echo "• | Hang tight while we install some things."

            echo "• | Creating folder for the bot. This can be moved if needed."
            mkdir -p "$HOME/unifierbot"
            main="$HOME/unifierbot"

            echo "• | Downloading Unifier files."
            git clone https://github.com/UnifierHQ/unifier $main

            echo "• | Finishing things up."
            rm -rf "$HOME/.unifiersetuptemp" # Make sure you DO NOT set this to "$HOME", scary....

            echo "• | Here's a brief tutorial on how to start unifier etc."
            echo "◦ | The script to start unifier is in: $HOME/unifierbot/run.sh"
            echo "◦ | More info on how to use unifier is in the wiki: https://wiki.unifierhq.org"
            ;;
        2)
            if [ -d "$HOME/unifierbot" ]; then
                echo "• | Removing Unifier installation..."
                rm -rf "$HOME/unifierbot"
                echo "• | Unifier has been removed."
            else
                echo "• | Unifier is not installed, nothing to remove."
            fi
            ;;
        3)
            echo "• | Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid option. Please select 1, 2, or 3."
            ;;
    esac
done
