import importlib, sys
pkgs = ["numpy","pandas","seaborn","matplotlib","sklearn","scipy","jupyterlab"]
missing = [p for p in pkgs if importlib.util.find_spec(p) is None]
if missing:
    print("Faltan paquetes:", missing)
    sys.exit(1)
print("OK: entorno y paquetes disponibles.")
