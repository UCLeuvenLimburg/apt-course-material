import json
import sys


data = json.loads(sys.stdin.read())
rid = sys.argv[1]

result = sorted( exam['course'] for exam in data['exams'] if exam['student_id'] == rid )

print("\n".join(result))
