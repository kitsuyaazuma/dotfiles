#!/bin/bash
set -euo pipefail

if [ "$(uname)" = "Darwin" ]; then
    if ! command -v brew >/dev/null 2>&1; then
        echo "install Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew is already installed"
    fi

    brew bundle --file="$(dirname "$0")/homebrew/Brewfile"
fi
