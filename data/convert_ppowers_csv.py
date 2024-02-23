import csv
import pandas as pd

with open("ppowers_raw.txt", "r") as f:
	output_csv = []
	for doy, line in enumerate(f):
		line = line.replace('\n','')
		line = line.replace('m','')
		line = line.replace('s','')
		line = line.split(" ")
		minutes_to_seconds = 60*int(line[2])
		line[3] = int(line[3])
		if int(line[2]) < 0: line[3] = -line[3]
		minutes_to_seconds += line[3]
		output_csv.append([doy, minutes_to_seconds])

ppowers_df = pd.DataFrame(output_csv, columns=["DOY", "EOT"])
ppowers_df.to_csv("ppowers_csv.csv", index=False)
