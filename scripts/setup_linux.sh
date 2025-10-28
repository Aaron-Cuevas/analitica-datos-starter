#!/usr/bin/env bash
set -euo pipefail

if command -v apt >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y python3 python3-venv python3-pip git gh
else
  echo "Esta guía está preparada para Debian/Ubuntu. Adapta los paquetes a tu distribución."
fi

python3 -m venv .venv
# shellcheck disable=SC1091
source .venv/bin/activate

python -m pip install -U pip wheel
python -m pip install -r requirements.txt -r requirements-dev.txt
pre-commit install

python scripts/quick_check.py || true
echo "Listo. Activa con: source .venv/bin/activate"
