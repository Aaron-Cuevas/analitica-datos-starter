#!/usr/bin/env bash
set -euo pipefail

xcode-select --install || true

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install python git gh || true

python3 -m venv .venv
# shellcheck disable=SC1091
source .venv/bin/activate

python -m pip install -U pip wheel
python -m pip install -r requirements.txt -r requirements-dev.txt
pre-commit install

python scripts/quick_check.py || true
echo "Listo. Activa con: source .venv/bin/activate"
