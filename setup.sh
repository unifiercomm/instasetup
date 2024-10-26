#!/bin/bash

echo "• | Welcome to the Unifier Instant Setup script!"

echo "• | Hang tight while we install some things."

echo "• | Creating temporary folder for installation process."
mkdir -p "$HOME/.unifiersetuptemp"

echo "• | Creating folder for the bot. This can be moved if needed."
mkdir -p "$HOME/unifierbot"

echo "• | Downloading dependency list."
curl -o "$HOME/requirements.txt" https://raw.githubusercontent.com/UnifierHQ/unifier/refs/heads/main/requirements.txt | pip install -r requirements.txt

