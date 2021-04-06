import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('./Data/noisy_circle_data.csv')
print(df)

df.plot.scatter(x = 'x_coord', y = 'y_coord')
plt.title("Noisy Circle!")
plt.xlabel('x')
plt.ylabel('y')
plt.show()
