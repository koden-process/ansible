#!/bin/bash

set -e
set -o pipefail

# Install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
  echo "[INFO] Install macOS Command Line Tools"
  xcode-select --install
fi

# Install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
  echo "[INFO] Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
  echo "[INFO] Install Ansible"
  brew install ansible
fi

# Create dev directory in home directory
if [[ ! -d ~/dev ]]; then
  echo "[INFO] Create dev directory in home directory"
  mkdir -p ~/dev
fi

echo "[INFO] Done"
exit 0
