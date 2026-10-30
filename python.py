import pandas as pd

# reading csv file

df = pd.read_csv("employees.csv")

# display first rows

answer = df.shape
print(answer)