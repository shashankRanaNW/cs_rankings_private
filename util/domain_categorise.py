# import csv

# # Lists of keywords as strings
# ai_keywords = [
#     "Neural", "Reinforcement", "Learning", "Natural", "Language",
#     "Deep", "Learning", "Machine", "Learning", "Computer", "Vision", "Robotics", "Automation",
#     "Cognitive", "Computing", "Genetic", "Algorithms", "Fuzzy", "Logic", "Artificial", "Intelligence", "Data"
# ]

# systems_keywords = [
#     "Control", "Cyber-Physical",  "Distributed", "Embedded", "Information", "System","Systems""Integration","Network", "Operating", "Systems", "Power", "Systems",
#     "Communication", "Systems", "Biometric", "Systems", "Transportation", "Systems", 
#     "Distributed", "Parallel", "Processing"
# ]

# theory_keywords = [
#     "Computational", "Complexity", "Algorithm", "Analysis", "Graph", "Theory",
#     "Game", "Theory", "Information", "Theory", "Complexity", "Theory",
#     "Number", "Theory", "Set", "Theory", "Group", "Theory",
#     "Probability", "Theory", "Statistics", "Topology"
# ]

# # Function to check if value matches any keywords
# def check_keywords(value, keywords):
#     return any(word in keywords for word in value.split())

# # Read CSV and check the 3rd column
# def check_csv(filename):
#     matches = []  # List to store matches
#     with open(filename, 'r') as file:
#         reader = csv.reader(file)
#         next(reader)  # Skip header
#         for row in reader:
            
#             domain = row[2]  # Assuming index 2 is the 3rd column (domain)
#             if check_keywords(domain, ai_keywords):
#                 matches.append((domain, "ai"))
#             elif check_keywords(domain, systems_keywords):
#                 matches.append((domain, "system"))
#             elif check_keywords(domain, theory_keywords):
#                 matches.append((domain, "theory"))
#             else:
#                 matches.append((domain, "Interdisciplinary Idea"))
#     return matches

# # Example usage
# csv_filename = '/home/himanshu/CS_Rankings/generated-author-info.csv'
# results = check_csv(csv_filename)
# for name, domain in results:  # Printing only top 10
#     print("Name:", name, "| Domain:", domain)
import csv

# Lists of keywords as strings
ai_keywords = [
    "Neural", "Reinforcement", "Learning", "Natural", "Language",
    "Deep", "Learning", "Machine", "Learning", "Computer", "Vision", "Robotics", "Automation",
    "Cognitive", "Computing", "Genetic", "Algorithms", "Fuzzy", "Logic", "Artificial", "Intelligence", "Data"
]

systems_keywords = [
    "Control", "Cyber-Physical",  "Distributed", "Embedded", "Information", "System","Systems", "Integration","Network", "Operating", "Systems", "Power", "Systems",
    "Communication", "Systems", "Biometric", "Systems", "Transportation", "Systems", 
    "Distributed", "Parallel", "Processing" , "Security", "Privacy", ""
]

theory_keywords = [
    "Computational", "Complexity", "Algorithm", "Analysis", "Graph", "Theory",
    "Game", "Theory", "Information", "Theory", "Complexity", "Theory",
    "Number", "Theory", "Set", "Theory", "Group", "Theory",
    "Probability", "Theory", "Statistics", "Topology"
]

# Function to check if value matches any keywords
def check_keywords(value, keywords):
    return any(word in keywords for word in value.split())

# Read CSV and check the 3rd column
def check_csv(filename):
    rows_with_domains = []  # List to store rows with domains
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        header = next(reader)  # Read header
        header.append('Domain')  # Add 'Domain' header
        for row in reader:
            domain = row[2]  # Assuming index 2 is the 3rd column (domain)
            if check_keywords(domain, ai_keywords):
                row.append(str("Artificial Intelligence"))
            elif check_keywords(domain, systems_keywords):
                row.append(str("Systems"))
            elif check_keywords(domain, theory_keywords):
                row.append(str("Theory"))
            else:
                row.append(str("Interdisciplinary Subjects"))
            rows_with_domains.append(row)
    return header, rows_with_domains

# Write processed CSV with domain column
def write_csv(output_filename, header, rows):
    with open(output_filename, 'w', newline='') as outfile:
        writer = csv.writer(outfile)
        writer.writerow(header)  # Write header
        writer.writerows(rows)  # Write rows with domain column

# Example usage
input_csv_filename = './generated-author-info.csv'
output_csv_filename = './generated-author-info-dom-info.csv'

header, rows_with_domains = check_csv(input_csv_filename)
write_csv(output_csv_filename, header, rows_with_domains)
print("CSV with domains created successfully!")

