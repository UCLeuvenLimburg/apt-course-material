import collections
import json
import sys


data = json.loads(sys.stdin.read())
rid = sys.argv[1]

frequencies = collections.Counter( exam['timeslot'] for exam in data['exams'] if exam['student_id'] == rid )
result = sorted(timeslot for timeslot, frequency in frequencies.items() if frequency > 1)

print("\n".join(str(x) for x in result))
