# Ejecutar en PowerShell (Windows)
# Si se pide confirmación de ejecución de scripts, ejecutar antes:
#   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Write-Host "Winget no está disponible. Instalar desde Microsoft Store (App Installer)."
} else {
  winget install -e --id Python.Python.3.12
  winget install -e --id Git.Git
  winget install -e --id GitHub.cli
}

py -3 -m venv .venv
.\.venv\Scripts\Activate.ps1

python -m pip install -U pip wheel
python -m pip install -r requirements.txt -r requirements-dev.txt
pre-commit install

python scripts\quick_check.py
Write-Host "Listo. Activa con: .\.venv\Scripts\Activate.ps1"
