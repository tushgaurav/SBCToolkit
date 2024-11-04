#!/bin/bash

echo "

█▀ █▄▄ █▀▀ ▀█▀ █▀█ █▀█ █░░ █▄▀ █ ▀█▀
▄█ █▄█ █▄▄ ░█░ █▄█ █▄█ █▄▄ █░█ █ ░█░
"

# Update and upgrade packages
echo "Updating and upgrading packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install essential programs
echo "Installing essential programs..."
sudo apt-get install -y \
    htop \
    vim \
    raspi-config \
    git \
    curl \
    wget \
    python3 \
    python3-pip

echo "Setup complete!"
echo "Your Raspberry Pi is now ready to use!