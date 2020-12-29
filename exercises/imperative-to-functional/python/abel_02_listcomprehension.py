import json
import sys

f = sys.stdin.read()
data = json.loads(f)
rid = sys.argv[1]

exams_for_student = [exam['course'] for exam in data['exams'] if exam['student_id'] == rid]

print("\n".join(exams_for_student))
