# Entorno de Análisis de Datos —  (Windows · macOS · Linux)

Este repositorio instala un entorno de trabajo para análisis de datos de forma reproducible. Incluye estructura de proyecto, cuadernos de ejemplo, verificación automática de calidad y una guía paso a paso para cada sistema operativo.

---

## 0) Requisitos generales
- Conexión a internet.
- Permisos para instalar software (cuando se solicite).
- Cuenta de GitHub (opcional para publicar).

---

## 1) Instalación por sistema operativo

### 1.1 macOS
1. Abrir **Terminal** (Spotlight ⌘+Espacio → “Terminal”).
2. Instalar herramientas de línea de comandos:
   ```bash
   xcode-select --install
   ```
3. (Opcional) Instalar Homebrew:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ```
4. Instalar Python y utilidades con Homebrew (opcional, recomendado):
   ```bash
   brew install python git gh
   ```
5. Crear entorno y activar:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```
6. Instalar dependencias:
   ```bash
   python -m pip install -U pip wheel
   python -m pip install -r requirements.txt -r requirements-dev.txt
   pre-commit install
   ```
7. Verificar y abrir JupyterLab:
   ```bash
   python scripts/quick_check.py
   jupyter lab
   ```

> Alternativa automática en macOS: ejecutar `scripts/setup_macos.sh` desde la carpeta del proyecto.

---

### 1.2 Linux (Ubuntu/Debian)
1. Abrir **Terminal**.
2. Instalar paquetes base:
   ```bash
   sudo apt update
   sudo apt install -y python3 python3-venv python3-pip git gh
   ```
3. Crear entorno y activar:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```
4. Instalar dependencias y verificar:
   ```bash
   python -m pip install -U pip wheel
   python -m pip install -r requirements.txt -r requirements-dev.txt
   pre-commit install
   python scripts/quick_check.py
   jupyter lab
   ```

> Alternativa automática en Linux: ejecutar `scripts/setup_linux.sh`.

---

### 1.3 Windows (PowerShell)
**Opción A — Windows nativo con PowerShell**
1. Abrir **PowerShell** como usuario normal.
2. Instalar herramientas con Winget (si está disponible):
   ```powershell
   winget install -e --id Python.Python.3.12
   winget install -e --id Git.Git
   winget install -e --id GitHub.cli
   ```
3. Crear y activar entorno:
   ```powershell
   py -3 -m venv .venv
   .\.venv\Scripts\Activate.ps1
   ```
4. Instalar dependencias y verificar:
   ```powershell
   python -m pip install -U pip wheel
   python -m pip install -r requirements.txt -r requirements-dev.txt
   pre-commit install
   python scripts\quick_check.py
   jupyter lab
   ```

**Opción B — Windows Subsystem for Linux (WSL + Ubuntu)**
1. Habilitar WSL e instalar Ubuntu desde Microsoft Store.
2. Abrir Ubuntu y seguir **los pasos de Linux** de arriba.

> Alternativa automática en Windows: ejecutar `scripts\setup_windows.ps1` en PowerShell.

---

## 2) Flujo de trabajo básico
```bash
# Crear/activar entorno (macOS/Linux)
python3 -m venv .venv
source .venv/bin/activate

# Instalar dependencias
python -m pip install -U pip wheel
python -m pip install -r requirements.txt -r requirements-dev.txt
pre-commit install

# Verificación rápida y abrir JupyterLab
python scripts/quick_check.py
jupyter lab
```

En Windows (PowerShell) los comandos equivalentes usan `py -3 -m venv .venv` y `.\.venv\Scripts\Activate.ps1`.

---

## 3) Estructura del proyecto
```
.
├─ notebooks/              # notebooks de ejemplo
├─ src/                    # utilidades/funciones del proyecto
├─ data/                   # datos (raw/processed) – ignorados por git
├─ docs/                   # documentación
├─ scripts/                # scripts (setup, fetch_data, quick_check)
├─ .github/workflows/      # CI (GitHub Actions)
├─ .devcontainer/          # entorno reproducible para Codespaces/VSCode
├─ requirements*.txt       # dependencias
├─ Makefile                # tareas: setup, dev, check, lab, lock, docs-*
└─ mkdocs.yml              # configuración de documentación
```

---

## 4) Publicar el repositorio en GitHub

### Con GitHub CLI (recomendado)
> Sustituir `<REPO>` por el nombre del repositorio. Evitar caracteres `< >` en el comando final.
```bash
gh auth login
git init
git add .
git commit -m "Inicial: starter pro multiplataforma"
git branch -M main
USER="Aaron-Cuevas"; REPO="<REPO>"
gh repo create "$USER/$REPO" --public --source=. --remote=origin --push
```

### Con Git estándar
1. Crear el repositorio vacío en GitHub (sin README).
2. En la carpeta del proyecto:
   ```bash
   git init
   git add .
   git commit -m "Inicial: starter pro multiplataforma"
   git branch -M main
   git remote add origin https://github.com/Aaron-Cuevas/<REPO>.git
   git push -u origin main
   ```

> Nota: en shells como `zsh`, escribir `<usuario>` o `<repo>` literalmente causa errores de redirección. Usar valores reales o variables como en el ejemplo (`USER="Aaron-Cuevas"`).

---

## 5) Traer este repositorio y activar automatizaciones (en otra máquina)
```bash
git clone https://github.com/Aaron-Cuevas/<REPO>.git
cd <REPO>
python3 -m venv .venv            # Windows: py -3 -m venv .venv
source .venv/bin/activate        # Windows: .\.venv\Scripts\Activate.ps1
python -m pip install -U pip wheel
python -m pip install -r requirements.txt -r requirements-dev.txt
pre-commit install
python scripts/quick_check.py
jupyter lab
```

---

## 6) Comandos útiles
- `make setup` – crea el entorno e instala dependencias (macOS/Linux).
- `make dev` – instala dependencias de desarrollo y activa pre-commit.
- `make check` – ejecuta análisis estático y verificación rápida.
- `make lab` – abre JupyterLab.
- `make lock` – regenera `requirements.txt`.
- `make docs-serve` / `make docs-deploy` – documentación local / publicación en gh-pages.

En Windows sin `make`, usar los comandos equivalentes listados en las secciones de instalación.

---

## Licencia y citación
- Licencia: MIT (archivo `LICENSE`).
- Citación: `CITATION.cff`.
