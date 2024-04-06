import csv
from typing import Dict, List

# Initialize dictionaries to store the lists for each type
a_star_list = []
a_list = []
b_list = []

# Read the CSV file
with open('/home/himanshu/CS_Rankings/CORE.csv', 'r') as csv_file:
    csv_reader = csv.reader(csv_file)
    
    # Skip the header if present
    next(csv_reader)
    
    # Iterate through each row in the CSV file
    for row in csv_reader:
        # Check the value of the 5th column
        if row[4] == 'A*':
            # Append 2nd and 3rd columns to the A* list
            a_star_list.append([row[1], row[2]])
        elif row[4] == 'A':
            # Append 2nd and 3rd columns to the A list
            a_list.append([row[1], row[2]])
        elif row[4] == 'B':
            # Append 2nd and 3rd columns to the B list
            b_list.append([row[1], row[2]])

# Print the lists for each type
print("List for A*: ", a_star_list)
# print("List for A: ", a_list)
# print("List for B: ", b_list)

areadict_a_star: Dict[str, List[str]] = {area: [] for area, _ in a_star_list}
areadict_a: Dict[str, List[str]] = {area: [] for area, _ in a_list}
areadict_b: Dict[str, List[str]] = {area: [] for area, _ in b_list}

# Populate the dictionary with conferences
for area, conference in a_star_list:
    areadict_a_star[area].append(conference)
for area, conference in a_list:
    areadict_a[area].append(conference)
for area, conference in b_list:
    areadict_b[area].append(conference)

# Print the resulting dictionary
print(areadict_a_star)