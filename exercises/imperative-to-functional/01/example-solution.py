import json
import sys

data = json.loads(sys.stdin.read())

courses = ( exam['course'] for exam in data['exams'] )
result = sorted(list(set(courses)))

print("\n".join(result))
