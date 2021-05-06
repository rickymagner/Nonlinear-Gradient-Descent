import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('noisy_cubic_data.csv')
print(df)

df.plot.scatter(x = 'x_coord', y = 'y_coord')
plt.title("Noisy Cubic!")
plt.xlabel('x')
plt.ylabel('y')
plt.show()
