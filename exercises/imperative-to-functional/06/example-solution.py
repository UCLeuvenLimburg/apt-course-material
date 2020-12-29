import collections
import json
import sys


data = json.loads(sys.stdin.read())

locations = [ exam['location'] for exam in data['exams'] ]

print(max(locations, key=lambda loc: locations.count(loc)))