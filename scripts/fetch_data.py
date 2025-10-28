import os, pandas as pd
RAW = os.path.join(os.path.dirname(__file__), "..", "data", "raw")
os.makedirs(RAW, exist_ok=True)
url = "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/penguins.csv"
df = pd.read_csv(url)
out = os.path.join(RAW, "penguins.csv")
df.to_csv(out, index=False)
print("Descargado:", out, "filas:", len(df))
