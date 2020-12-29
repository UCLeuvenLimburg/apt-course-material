import json
import sys

f = sys.stdin.read()
data = json.loads(f)

locations = [exam['location'] for exam in data['exams']]
locations_over_capacity = set([location for location in locations if locations.count(location) > data['room_capacities'][location]])


print("\n".join(locations_over_capacity))
