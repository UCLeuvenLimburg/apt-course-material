import collections
import json
import sys


data = json.loads(sys.stdin.read())

frequencies = collections.Counter(exam['location'] for exam in data['exams'])
result = max((location for location, _ in frequencies.items()), key=lambda loc: frequencies[loc])

print(result)
