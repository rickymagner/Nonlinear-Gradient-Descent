import numpy as np
import pandas as pd
import math
import random

""" Generate a set of data sampled from an ellipse with some noise,
and export it to a csv file. """

# radius of circle
radius = 1

# center of circle
center_x = 0
center_y = 0

# amount of noise around circle
noise = .1

data_set_size = 500

# random angle
def rand_angle():
	return 2 * math.pi * random.random()

# random point on noisy circle
def rand_point():	
	theta = rand_angle()
	rand_radius = radius + np.random.normal(0,noise)
	x_coord = rand_radius * math.cos(theta) + center_x
	y_coord = rand_radius * math.sin(theta) + center_y
	return (x_coord, y_coord)

# create list of points on noisy circle
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
	df.to_csv('./noisy_circle_data.csv')

create_dataset(data_set_size)
