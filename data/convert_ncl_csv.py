import csv
import pandas as pd

with open("ncl_output.txt", "r") as f:
	output_csv = []
	for doy, line in enumerate(f):
		line = line.replace('\n','')
		line = line.replace('(','')
		line = line.replace(')','')
		line = line.split(" ")
		time_step = int(line[0])
		ncl_output = float(line[1])
		output_csv.append([time_step, ncl_output])

ncl_df = pd.DataFrame(output_csv, columns=["Time Step", "Coeffs"])
ncl_df.to_csv("ncl_csv.csv", index=False)
