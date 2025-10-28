# Contributing

- Crear entorno:
  ```bash
  python3 -m venv .venv
  source .venv/bin/activate
  python -m pip install -U pip wheel
  python -m pip install -r requirements.txt -r requirements-dev.txt
  pre-commit install
  ```
- Crear rama: `git checkout -b feature/<nombre>`
- Ejecutar `make check` antes de commitear.
