import numpy as np
import pandas as pd
import random


""" Generate a set of data sampled along a cubic curve with some noise,
and export it to a csv file."""


# amount of noise along curve
noise = 1

data_set_size = 500


# random point on noisy cubic
def rand_point():
	x_coord = np.random.uniform(-2,2)
	y_coord = x_coord ** 3 - x_coord ** 2 - x_coord + 1 + np.random.normal(0,noise)
	return (x_coord, y_coord)

# create list of points on noisy cubic
def generate_points(number):
	points = []
	for i in range(number):
		points.append(rand_point())
	return points

# create and export the dataset
def create_dataset(num_points):
	data = generate_points(num_points)
	df = pd.DataFrame(data)
	df.columns = ['x_coord', 'y_coord']
	df.to_csv('noisy_cubic_data.csv')

create_dataset(data_set_size)
