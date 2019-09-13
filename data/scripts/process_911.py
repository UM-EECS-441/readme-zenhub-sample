import csv
import sys
sys.path.append("../")
import numpy as np


def read_csv(fn):
    reader = csv.reader(open(fn, "r", newline=''), dialect="excel")
    entries = [line.strip() for line in reader]
    crime_class = entries[2]
    time_stamps = entries[1]
    raw_data = entries[3:]
    lat = raw_data.split(';')[0]
    lon = raw_data.split(';')[1]
    data = np.stack([crime_class, time_stamps, lat, lon], axis=1)
    return data

def write_csv(data):
    w = open("out/911_call_for_service.csv", 'w+', newline='')
    writer = csv.writer(w)
    writer.writerow(["crime_class", "timestamp", "lat", "lon"])
    writer.writerows(data)

if __name__ == "__main__":
    city = sys.argv[1]
    PATH = "../Raw_Data/911_call_for_service.csv"
    raw_data = read_csv(PATH)
    write_csv(raw_data)
