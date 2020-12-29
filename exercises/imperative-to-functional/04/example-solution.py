import collections
import json
import sys


data = json.loads(sys.stdin.read())

frequencies = collections.Counter(exam['location'] for exam in data['exams'])
result = sorted(location for location, frequency in frequencies.items() if frequency > data['room_capacities'][location])

print("\n".join(str(x) for x in result))
